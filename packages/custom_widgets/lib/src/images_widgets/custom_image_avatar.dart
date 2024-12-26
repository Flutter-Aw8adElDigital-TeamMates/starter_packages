import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_cached_image.dart';
import 'package:core/core.dart' show AppDimensions;


class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    Key? key,
    this.backgroundColor,
    required this.radius,
    required this.icon,
    this.imageColor,
    this.imageSize,
    this.applyMask = false,
    this.isAsset = false,
    this.isNetwork = true,
  })  : assert((isAsset && !isNetwork) || (!isAsset && isNetwork),
  'Either isAsset or isNetwork must be true, but not both.'),
        assert(icon != null && icon.length>0, 'The iconUrl must not be null or empty.'),
        super(key: key);

  final Color? backgroundColor;
  final double radius;
  final String? icon;
  final Color? imageColor;
  final Size? imageSize;
  final bool applyMask;
  final bool isAsset;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.transparent,
      child: Center(
        child: SizedBox(
          height: imageSize?.height ?? radius * 2 - AppDimensions.w(0),
          width: imageSize?.width ?? radius * 2 - AppDimensions.w(0),
          child: Builder(
            builder: (BuildContext context) {
              return isAsset ? _buildAssetImage(context) : _buildNetworkImage(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAssetImage(BuildContext context) {
    if (icon!.endsWith('.svg')) {
      return SvgPicture.asset(
        icon!,
        height: imageSize?.height ?? radius * 1.5 - AppDimensions.w(5),
        width: imageSize?.width ?? radius * 1.5 - AppDimensions.w(5),
        colorFilter: ColorFilter.mode(
          imageColor ??
              (applyMask
                  ? Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.transparent
                  : Colors.transparent),
          BlendMode.srcIn,
        ),
      );
    } else {
      return Image.asset(
        icon!,
        height: imageSize?.height ?? radius * 1.5 - AppDimensions.w(5),
        width: imageSize?.width ?? radius * 1.5 - AppDimensions.w(5),
        fit: BoxFit.cover,
      );
    }
  }

  Widget _buildNetworkImage(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: ClipOval(
            child: Container(
              color: backgroundColor,
              child: CustomCachedImage(
                applyMask: applyMask,
                imageSize: Size(radius * 2, radius * 2),
                image: icon,
                fit: BoxFit.cover,
                imageColor: imageColor,
                isNetwork: true,
                isAsset: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
