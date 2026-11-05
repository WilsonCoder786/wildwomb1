import 'package:flutter/material.dart';

class AppNavigator {
  // static Future<T?> toName<T>({
  //   required BuildContext context,
  //   required Widget page,
  // }) {
  //   return Navigator.of(
  //     context,
  //   ).push<T>(MaterialPageRoute(builder: (_) => page));
  // }

  static Future<T?> toName<T>({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static Future<T?> offAllName<T>({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.of(context).pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static Future<T?> offName<T>({
    required BuildContext context,
    required Widget page,
  }) {
    return Navigator.of(
      context,
    ).pushReplacement<T, dynamic>(MaterialPageRoute(builder: (_) => page));
  }
}
