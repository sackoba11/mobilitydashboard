import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required super.child,
  }) : super(
            key: key,
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secondAnimation, child) =>
                FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondAnimation,
                  fillColor: Colors.white,
                  child: child,
                ));
}
