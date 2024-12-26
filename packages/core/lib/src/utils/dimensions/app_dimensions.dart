import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_dimensions_config.dart';

class AppDimensions {
  static late AppDimensionsConfig _config;

  // Initialize with custom configuration
  static void initialize(BuildContext context, AppDimensionsConfig config) {
    _config = config;
    ScreenUtil.init(context, designSize: _config.designSize);
  }

  // Device dimensions
  static double get screenWidth => ScreenUtil().screenWidth;
  static double get screenHeight => ScreenUtil().screenHeight;

  // Configurable values
  static double get screenPadding => _config.screenPadding.w;
  static double get buttonHeight => _config.buttonHeight.h;
  static double get appBarHeight => _config.appBarHeight.h;
  static double get navBarHeight => _config.navBarHeight.h;

  static double get cardBorderRadius => _config.cardBorderRadius.r;
  static double get bottomSheetBorderRadius => _config.bottomSheetBorderRadius.r;

  // Predefined font sizes
  static double get fontSizeSmall => _config.fontSizeSmall.sp;
  static double get fontSizeMedium => _config.fontSizeMedium.sp;
  static double get fontSizeLarge => _config.fontSizeLarge.sp;
  static double get fontSizeExtraLarge => _config.fontSizeExtraLarge.sp;

  // Custom font size
  static double fontSizeCustom(double size) {
    return size.sp;
  }

  // Spacing utilities
  static double spacing(double value) => value.h;

  static double get smallSpacing => spacing(8);
  static double get mediumSpacing => spacing(16);
  static double get largeSpacing => spacing(32);

  // Height and width utilities
  static double h(double value) => value.h;
  static double w(double value) => value.w;
  static double r(double value) => value.r;

  // Full dimensions
  static double get fullWidth => screenWidth;
  static double get fullHeight => screenHeight;

  // Device-specific heights
  static double deviceHeight(double mobileHeight, double tabletHeight) {
    return fullWidth > 700 ? tabletHeight : mobileHeight;
  }

  // Media query-based available height
  static double availableHeight(BuildContext context) {
    final Size media = MediaQuery.sizeOf(context);
    final EdgeInsets padding = MediaQuery.paddingOf(context);
    return media.height - (AppBar().preferredSize.height + padding.top);
  }
}
