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
  })  : assert((isAsset && !isNetwork && !isIcon) || (!isAsset && isNetwork && !isIcon) || (!isAsset && !isNetwork && isIcon),
  'Either isAsset or isNetwork or isIcon must be true, but not both.'),
        assert((image == null && icon !=null) ||(image != null && icon ==null  ),
        'Either provide image, or icon data, but not both.'),
        assert(icon !=null && isIcon,'if you set isIcon to true, you must provide icon'),
        assert(image != null && image.length>0, 'The iconUrl must not be null or empty.'),
        assert((isAsset || isNetwork || isIcon),'at least on of them must be true'),
        super(key: key);

  final Color? backgroundColor;
  final double radius;
  final String? image;
   final IconData? icon;
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
        child: isIcon? Icon(icon): SizedBox(
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
