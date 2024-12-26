import 'package:core/core.dart' show AppDimensions;
import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final bool isEnabled;
  final void Function()? onPressed;

  // Colors
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? rippleColor;

  // Icon Properties
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  // Elevation and Shape
  final double? elevation;
  final double? borderRadius;
  final OutlinedBorder? shape;

  // Border
  final double? borderWidth;
  final Color? borderColor;

  // Padding and Margin
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  // Typography
  final TextStyle? textStyle;

  // Splash Factory
  final InteractiveInkFeatureFactory? splashFactory;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.isEnabled = true,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.rippleColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.elevation,
    this.borderRadius,
    this.shape,
    this.borderWidth,
    this.borderColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.splashFactory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: width ?? AppDimensions.fullWidth * 0.8,
        height: height ?? AppDimensions.buttonHeight,
        child: ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: ButtonStyle(
            // Colors
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return disabledBackgroundColor ?? Colors.grey[300];
              }
              return backgroundColor ?? Theme.of(context).primaryColor;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                return disabledForegroundColor ?? Colors.grey[600];
              }
              return foregroundColor ?? Colors.white;
            }),
            overlayColor: WidgetStateProperty.all(rippleColor ?? Colors.black26),

            // Elevation
            elevation: WidgetStateProperty.all(elevation ?? 2),

            // Padding
            padding: WidgetStateProperty.all(
              padding ?? EdgeInsets.symmetric(horizontal: AppDimensions.spacing(16)),
            ),

            // Shape
            shape: WidgetStateProperty.all(
              shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      borderRadius ?? AppDimensions.cardBorderRadius,
                    ),
                    side: BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 0.0,
                    ),
                  ),
            ),

            // Text Style
            textStyle: WidgetStateProperty.all(
              textStyle ??
                  TextStyle(
                    fontSize: AppDimensions.fontSizeMedium,
                    fontWeight: FontWeight.w600,
                  ),
            ),

            // Splash Factory
            splashFactory: splashFactory ?? InkRipple.splashFactory,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize ?? AppDimensions.fontSizeMedium,
                  color: iconColor ?? foregroundColor ?? Colors.white,
                ),
              if (icon != null) SizedBox(width: AppDimensions.spacing(8)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
