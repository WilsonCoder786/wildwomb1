import 'package:easy_four_diy/core/app_navigator.dart';
import 'package:easy_four_diy/core/utils.dart';
import 'package:easy_four_diy/l10n/app_localizations.dart';
import 'package:easy_four_diy/modules/root/root_view.dart';
import 'package:easy_four_diy/modules/subscription/subscritption_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  String? _lastVerificationStatus;

  void _showMessage(
    String message, {
    bool isSuccess = false,
    bool isError = false,
  }) {
    if (!mounted) return;
    final color = isSuccess
        ? Colors.green
        : isError
        ? Colors.red
        : Colors.blueGrey;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Consumer<SubscriptionProvider>(
      builder: (context, provider, child) {
        // React to premium becoming active — close the screen and go to root.
        if (provider.isPremium) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _showMessage(
              l10n.subscriptionPremiumActivated,
              isSuccess: true,
            );

            Future.delayed(const Duration(milliseconds: 500), () {
              if (!context.mounted) return;
              AppNavigator.offAllName(context: context, page: const RootView());
            });
          });
        }

        // Show verification/purchase status messages.
        final verificationStatus = provider.verificationStatus;
        if (verificationStatus != null &&
            verificationStatus != _lastVerificationStatus) {
          _lastVerificationStatus = verificationStatus;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final isSuccess =
                verificationStatus.toLowerCase().contains('success') ||
                verificationStatus.toLowerCase().contains('verified') ||
                verificationStatus.toLowerCase().contains('activated');
            final isError =
                verificationStatus.toLowerCase().contains('error') ||
                verificationStatus.toLowerCase().contains('failed') ||
                verificationStatus.toLowerCase().contains('invalid');
            _showMessage(
              verificationStatus,
              isSuccess: isSuccess,
              isError: isError,
            );
          });
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // Top row: close + refresh
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  AppNavigator.offAllName(
                                    context: context,
                                    page: const RootView(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Header
                        _buildHeader(context),
                        const SizedBox(height: 30),

                        // Loading indicator
                        if (provider.isLoading)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF4F7FFA),
                              ),
                            ),
                          ),

                        // Empty / error state
                        if (!provider.isLoading && !provider.hasProducts)
                          _buildEmptyState(provider: provider, l10n: l10n),

                        // Subscription plan cards
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: List.generate(
                              provider.productsList.length,
                              (index) {
                                final product = provider.productsList[index];
                                final isMonthly = product.id
                                    .toLowerCase()
                                    .contains('monthly');
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: SubscriptionCard(
                                    title: isMonthly
                                        ? l10n.subscriptionMonthlyPlan
                                        : l10n.subscriptionYearlyPlan,
                                    price: isMonthly ? '€2.99' : '€19.99',
                                    subtitle: l10n.subscriptionRecurring,
                                    priceSuffix: isMonthly
                                        ? l10n.subscriptionPerMonth
                                        : l10n.subscriptionPerYear,
                                    badgeText: isMonthly
                                        ? l10n.subscriptionMostPopular
                                        : l10n.subscriptionBestValue,
                                    discountText: isMonthly
                                        ? null
                                        : l10n.subscriptionTwoMonthsFree,
                                    badgeColor: Utils.kOrange,
                                    isSelected: provider.planName == product.id,
                                    onTap: () {
                                      if (!provider.isPurchasing) {
                                        provider.selectProduct(product);
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Features list
                        _buildFeaturesSection(context),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),

                // ── Action Buttons ────────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      // Subscribe button
                      GestureDetector(
                        onTap:
                            provider.isPurchasing ||
                                provider.isVerifying ||
                                !provider.isAvailable ||
                                !provider.hasProducts
                            ? null
                            : () =>
                                  provider.buySelectedProduct(context: context),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity:
                              provider.isPurchasing ||
                                  provider.isVerifying ||
                                  !provider.isAvailable ||
                                  !provider.hasProducts
                              ? 0.6
                              : 1.0,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              color: Utils.kOrange,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Utils.kOrange.withValues(alpha: 0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Center(
                              child:
                                  (provider.isPurchasing ||
                                      provider.isVerifying)
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                  Colors.white,
                                                ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          provider.isVerifying
                                              ? l10n.subscriptionVerifying
                                              : l10n.subscriptionProcessing,
                                          style: const TextStyle(
                                            fontFamily: 'D-FONT-R',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      () {
                                        final price = provider
                                            .getProductPrice();
                                        return price != null
                                            ? l10n.subscriptionSubscribeWithPrice(price)
                                            : l10n.subscriptionSubscribe;
                                      }(),
                                      style: const TextStyle(
                                        fontFamily: 'D-FONT-R',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Restore Purchases button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed:
                              provider.isPurchasing || provider.isRestoring
                              ? null
                              : () => provider.restore(context: context),
                          icon: provider.isRestoring
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Utils.kDarkBlue,
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.restore,
                                  size: 20,
                                  color: Utils.kDarkBlue,
                                ),
                          label: Text(
                            provider.isRestoring
                                ? l10n.subscriptionRestoring
                                : l10n.subscriptionRestorePurchases,
                            style: const TextStyle(
                              fontFamily: 'D-FONT-R',
                              fontSize: 14,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            side: BorderSide(
                              color: Utils.kDarkBlue.withValues(alpha: 0.4),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Manage Subscription button
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () => provider.manageSubscription(),
                          icon: const Icon(
                            Icons.open_in_new,
                            size: 18,
                            color: Colors.grey,
                          ),
                          label: Text(
                            l10n.subscriptionManageSubscription,
                            style: const TextStyle(
                              fontFamily: 'D-FONT-R',
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          l10n.subscriptionChoosePlan,
          style: TextStyle(
            fontFamily: 'D-FONT-R',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Utils.kDarkBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'D-FONT-R',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Utils.kOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState({
    required SubscriptionProvider provider,
    required AppLocalizations l10n,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Icon(Icons.cloud_off_outlined, size: 48, color: Colors.grey),
          const SizedBox(height: 16),
          if (provider.errorMessage != null)
            Text(
              provider.errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 8),
          Text(
            l10n.subscriptionPlansNotLoaded,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: provider.isLoading
                ? null
                : () => provider.reloadProducts(),
            icon: provider.isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.refresh, size: 18),
            label: Text(provider.isLoading ? l10n.subscriptionLoading : l10n.subscriptionRetry),
            style: ElevatedButton.styleFrom(
              backgroundColor: Utils.kDarkBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> features = [
      l10n.onboardingUnlimitedJobs,
      l10n.onboardingAllFeatures,
      l10n.onboardingNoAds,
      l10n.onboardingPremiumSupport,
      l10n.onboardingUpdateNewJobs,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.subscriptionEverythingIncluded,
            style: TextStyle(
              fontFamily: 'D-FONT-R',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Utils.kDarkBlue,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Utils.kOrange,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontFamily: 'D-FONT-R',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Utils.kOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Subscription Card ────────────────────────────────────────────────────────

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final String priceSuffix;
  final String? badgeText;
  final String? discountText;
  final Color badgeColor;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.priceSuffix,
    this.badgeText,
    this.discountText,
    required this.badgeColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? Utils.kOrange
                    : Colors.grey.withValues(alpha: 0.5),
                width: 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Utils.kOrange.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'D-FONT-R',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Utils.kDarkBlue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontFamily: 'D-FONT-R',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Utils.kDarkBlue,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            priceSuffix,
                            style: TextStyle(
                              fontFamily: 'D-FONT-R',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'D-FONT-R',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      if (discountText != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.green.withValues(alpha: 0.4),
                              width: 0.8,
                            ),
                          ),
                          child: Text(
                            discountText!,
                            style: const TextStyle(
                              fontFamily: 'D-FONT-R',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Utils.kOrange
                          : Colors.grey.withValues(alpha: 0.5),
                      width: 1,
                    ),
                  ),
                  child: isSelected
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 18,
                            color: Utils.kOrange,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
          if (badgeText != null)
            Positioned(
              right: 12,
              top: -12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
