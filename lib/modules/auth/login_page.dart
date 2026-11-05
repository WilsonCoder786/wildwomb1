import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/services/app_service.dart';
import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/auth/signup_page.dart';
import 'package:easy_four_diy/modules/onboarding/onboarding_view.dart';
import 'package:easy_four_diy/modules/root/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      final l10n = AppLocalizations.of(context)!;
      EasyLoading.show(status: 'Logging in...');

      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      final existingUser = HiveService.getUserByEmail(email);
      EasyLoading.dismiss();

      if (existingUser != null) {
        // Verify password if one is stored
        final savedPassword = HiveService.getPassword(email);
        if (savedPassword != null && savedPassword != password) {
          if (mounted) EasyLoading.showError(l10n.authWrongPassword);
          return;
        }

        // Password OK (or no stored password for legacy accounts) — log in
        if (mounted) {
          await context.read<AppService>().setProfile(existingUser);

          if (existingUser.freeTrialUsed) {
            if (!mounted) return;
            AppNavigator.toName(context: context, page: const RootView());
          } else {
            if (!mounted) return;
            AppNavigator.toName(context: context, page: const OnboardingView());
          }
        }
      } else {
        if (mounted) {
          EasyLoading.showError(l10n.authUserNotFound);
        }
      }
    }
  }

  void _showForgotPasswordDialog() {
    final l10n = AppLocalizations.of(context)!;
    final emailCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          l10n.authForgotPasswordTitle,
          style: const TextStyle(
            color: Color(0xFF002D62),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.authForgotPasswordDesc,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) return l10n.authEmailRequired;
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(v)) {
                    return l10n.authEmailInvalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: l10n.authEmailHintShort,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(
                    Icons.mail_outline,
                    color: Color(0xFF002D62),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F9FA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              l10n.authCancel,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              final email = emailCtrl.text.trim();
              final user = HiveService.getUserByEmail(email);
              if (user == null) {
                Navigator.of(ctx).pop();
                EasyLoading.showError(l10n.authNoAccountFound);
                return;
              }
              Navigator.of(ctx).pop();
              _showResetPasswordDialog(email);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D00),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(l10n.authContinue),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(String email) {
    final l10n = AppLocalizations.of(context)!;
    final newPasswordCtrl = TextEditingController();
    final confirmPasswordCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) {
        bool obscureNew = true;
        bool obscureConfirm = true;

        return StatefulBuilder(
          builder: (ctx, setDialogState) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.lock_reset,
                      color: Color(0xFFFF4D00),
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.authNewPasswordTitle,
                      style: const TextStyle(
                        color: Color(0xFF002D62),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            content: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // New password
                  TextFormField(
                    controller: newPasswordCtrl,
                    obscureText: obscureNew,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return l10n.authPasswordRequired;
                      }
                      if (v.length < 6) {
                        return l10n.authPasswordMinLength;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: l10n.authNewPasswordLabel,
                      labelStyle: const TextStyle(
                        color: Color(0xFF002D62),
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF002D62),
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureNew ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onPressed: () =>
                            setDialogState(() => obscureNew = !obscureNew),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF002D62)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Confirm password
                  TextFormField(
                    controller: confirmPasswordCtrl,
                    obscureText: obscureConfirm,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return l10n.authConfirmPasswordRequired;
                      }
                      if (v != newPasswordCtrl.text) {
                        return l10n.authPasswordMismatch;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: l10n.authConfirmPasswordLabel,
                      labelStyle: const TextStyle(
                        color: Color(0xFF002D62),
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color(0xFF002D62),
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onPressed: () => setDialogState(
                          () => obscureConfirm = !obscureConfirm,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8F9FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF002D62)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  l10n.authCancel,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) return;
                  await HiveService.savePassword(email, newPasswordCtrl.text);
                  if (!ctx.mounted) return;
                  Navigator.of(ctx).pop();
                  // Pre-fill email so user can log in straight away
                  _emailController.text = email;
                  _passwordController.text = newPasswordCtrl.text;
                  EasyLoading.showSuccess(l10n.authPasswordChanged);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D00),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(l10n.authSave),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isEnglish = Utils.isEnglih(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // Background Image
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                isEnglish
                    ? 'assets/images/auth_bg_1.png'
                    : 'assets/images/auth_bg_2.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 250),

                      // Login Card
                      _buildLoginCard(l10n),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.authLogin,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002D62),
              fontFamily: 'D-FONT-M',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.authWelcomeMessage,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
              fontFamily: 'D-FONT-R',
            ),
          ),
          const SizedBox(height: 24),

          // Email Field
          Text(
            l10n.authEmail,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002D62),
              fontFamily: 'D-FONT-M',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: l10n.authEmailHint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: const Icon(
                Icons.mail_outline,
                color: Color(0xFF002D62),
              ),
              filled: true,
              fillColor: const Color(0xFFF8F9FA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Password Field
          Text(
            l10n.authPassword,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002D62),
              fontFamily: 'D-FONT-M',
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: l10n.authPasswordHint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: const Icon(
                Icons.lock_outline,
                color: Color(0xFF002D62),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              filled: true,
              fillColor: const Color(0xFFF8F9FA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _showForgotPasswordDialog(),
              child: Text(
                l10n.authForgotPassword,
                style: const TextStyle(
                  color: Color(0xFF002D62),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Login Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4D00),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.authLogin.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Footer
          Center(
            child: GestureDetector(
              onTap: () => AppNavigator.toName(
                context: context,
                page: const SignupPage(),
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black87, fontSize: 14),
                  children: [
                    TextSpan(text: l10n.authNoAccount),
                    TextSpan(
                      text: l10n.authCreateOne,
                      style: const TextStyle(
                        color: Color(0xFFFF4D00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
