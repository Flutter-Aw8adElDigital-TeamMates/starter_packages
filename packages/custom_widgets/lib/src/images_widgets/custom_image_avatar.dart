import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_cached_image.dart';
import 'package:core/core.dart' show AppDimensions;


class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    Key? key,
    this.backgroundColor,
    required this.radius,
    this.image,
    this.icon,
    this.imageColor,
    this.imageSize,
    this.applyMask = false,
    this.isAsset = false,
    this.isNetwork = false,
    this.isIcon = false,
  })  : assert((isIcon ? icon != null : true), 'If isIcon is set to true, then the icon cannot be null.'),
        assert((isAsset || isNetwork ? (image != null && image.length>0) : true), 'If isAsset or isNetwork is set to true, then the image cannot be null or empty.'),
        assert((isIcon ^ isAsset ^ isNetwork), 'Only one of isIcon, isAsset, or isNetwork can be true.'),
        assert((image == null) != (icon == null), 'One of image or icon must be null, and the other must have a value.'),
        super(key: key);

  final Color? backgroundColor;
  final double radius;
  final String? image;
   final Icon? icon;
  final Color? imageColor;
  final Size? imageSize;
  final bool applyMask;
  final bool isAsset;
  final bool isNetwork;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.transparent,
      child: Center(
        child: isIcon? icon: SizedBox(
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
    if (image!.endsWith('.svg')) {
      return SvgPicture.asset(
        image!,
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
        image!,
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
                image: image,
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
