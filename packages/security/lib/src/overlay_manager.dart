import 'package:flutter/material.dart';
import 'package:dash_shield/dash_shield.dart';

class OverlayManager {
  static Widget applyOverlay({
    required Widget child,
    Widget? overlayWidget,
  }) {
    return DashShieldOverlay(
      child: child,
      overlayWidget: overlayWidget ??
          Container(
            color: Colors.black,
            child: const Center(
              child: Text(
                'Secure Mode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
    );
  }
}
