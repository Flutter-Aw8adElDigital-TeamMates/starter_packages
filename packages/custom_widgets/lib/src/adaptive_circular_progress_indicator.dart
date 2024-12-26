import 'package:flutter/material.dart';

class AdaptiveCircularProgressIndicator extends StatelessWidget {
  const AdaptiveCircularProgressIndicator(
      {super.key, this.color = Colors.white, this.backgroundColor});
  final Color? backgroundColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(color!),
      backgroundColor: backgroundColor,
    );
  }
}
