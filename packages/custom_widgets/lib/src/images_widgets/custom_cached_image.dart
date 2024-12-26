import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:core/core.dart' show AppDimensions;


class CustomCachedImage extends StatelessWidget {
  final bool applyMask;
  final Color? imageColor;
  final String? image;
  final Size? imageSize;
  final Map<String, String>? httpHeaders;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final Duration? fadeOutDuration;
  final Duration fadeInDuration;
  final Curve fadeInCurve;


  final BoxFit? fit;
  final Alignment alignment;
  final ImageRepeat repeat;
  final bool matchTextDirection;

  final bool useOldImageOnUrlChange;
  final Color? color;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final int? memCacheWidth;
  final int? memCacheHeight;
  final String? cacheKey;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final ValueChanged<Object>? errorListener;

  final bool isAsset;
  final bool isNetwork;
  final double fallbackSize;

  const CustomCachedImage({
    super.key,
    this.applyMask = false,
    this.imageColor,
    required this.image,
    this.imageSize,
    this.httpHeaders,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeIn,
    this.fit,
    this.alignment = Alignment.center,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.useOldImageOnUrlChange = false,
    this.color,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    this.memCacheWidth,
    this.memCacheHeight,
    this.cacheKey,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.errorListener,
    this.isAsset = false,
    this.isNetwork = true,
    this.fallbackSize = 100.0,
  })  : assert((isAsset && !isNetwork) || (!isAsset && isNetwork),
  'Either isAsset or isNetwork must be true, but not both.'),
        assert(image != null && image.length>0, 'The image must not be null or empty.');

  @override
  Widget build(BuildContext context) {
    if (!_isValidNetworkImageUrl(image!) && isNetwork) {
      return const ErrorImageWidget();
    } else {
      return isAsset ? _buildAssetImage(context) : _buildNetworkImage(context);
    }
  }

  Widget _buildAssetImage(BuildContext context) {
    switch (_getImageType(image!)) {
      case ImageType.svg:
        return SvgPicture.asset(
          image!,
          height: imageSize?.height ?? AppDimensions.h(fallbackSize),
          width: imageSize?.width ?? AppDimensions.w(fallbackSize),
          fit: fit ?? BoxFit.contain,
        );
      case ImageType.raster:
      default:
        return Image.asset(
          image!,
          height: imageSize?.height ?? AppDimensions.h(fallbackSize),
          width: imageSize?.width ?? AppDimensions.w(fallbackSize),
          fit: fit ?? BoxFit.cover,
        );
    }
  }

  Widget _buildNetworkImage(BuildContext context) {
    switch (_getImageType(image!)) {
      case ImageType.svg:
        return SvgPicture.network(
          image!,
          height: imageSize?.height ?? AppDimensions.h(fallbackSize),
          width: imageSize?.width ?? AppDimensions.w(fallbackSize),
          colorFilter: ColorFilter.mode(
              imageColor ??
                  (applyMask
                      ? Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.transparent
                      : Colors.transparent),
              BlendMode.srcIn),
          placeholderBuilder: (BuildContext context) {
            return _placeHolderBuilder(context);
          },
        );
      case ImageType.raster:
      default:
        return Center(
          child: SizedBox(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                imageColor ?? Colors.white,
                applyMask
                    ? imageColor != null
                    ? BlendMode.srcIn
                    : Theme.of(context).brightness == Brightness.dark
                    ? BlendMode.srcIn
                    : BlendMode.dst
                    : BlendMode.dst,
              ),
              child: CachedNetworkImage(
                imageUrl: image!,
                httpHeaders: httpHeaders,
                imageBuilder: imageBuilder,
                placeholder: (BuildContext context, String url) {
                  return _placeHolderBuilder(context);
                },
                progressIndicatorBuilder: progressIndicatorBuilder,
                errorWidget: errorWidget ?? (context, url, error) => const ErrorImageWidget(),
                fadeOutDuration: fadeOutDuration,
                fadeInDuration: fadeInDuration,
                fadeInCurve: fadeInCurve,
                height: imageSize?.height ?? AppDimensions.h(fallbackSize),
                width: imageSize?.width ?? AppDimensions.w(fallbackSize),
                fit: fit,
                alignment: alignment,
                repeat: repeat,
                matchTextDirection: matchTextDirection,
                useOldImageOnUrlChange: useOldImageOnUrlChange,
                color: color,
                colorBlendMode: colorBlendMode,
                filterQuality: filterQuality,
                memCacheWidth: memCacheWidth,
                memCacheHeight: memCacheHeight,
                cacheKey: cacheKey,
                maxWidthDiskCache: maxWidthDiskCache,
                maxHeightDiskCache: maxHeightDiskCache,
                errorListener: errorListener,

              ),
            ),
          ),
        );
    }
  }

  ImageType _getImageType(String url) {
    final extension = path.extension(url).toLowerCase();
    if (extension == ".svg") {
      return ImageType.svg;
    } else {
      return ImageType.raster;
    }
  }

  bool _isValidNetworkImageUrl(String url) {
    final uri = Uri.tryParse(url);
    return uri != null && (uri.hasScheme && uri.hasAuthority);
  }

  Widget _placeHolderBuilder(BuildContext context) {
    return const LoadingImageWidget();
  }
}

enum ImageType { svg, raster }

// class ErrorWidget extends StatelessWidget {
//   const ErrorWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Icon(Icons.error,color: Colors.redAccent, size: AppDimensions.h(50)),
//     );
//   }
// }

class LoadingImageWidget extends StatelessWidget {
  const LoadingImageWidget({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final fallbackSize = AppDimensions.h(100);
        return Skeletonizer(
          child: Bone(
            height: size ?? (constraints.maxHeight != 0.0 ? constraints.maxHeight : AppDimensions.h(fallbackSize)),
            width: size ?? (constraints.maxWidth != 0.0 ? constraints.maxWidth : AppDimensions.w(fallbackSize)),
          ),
        );
      },
    );
  }
}

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final fallbackSize = AppDimensions.h(100);
          return Container(
            height: size ?? (constraints.maxHeight != 0.0 ? constraints.maxHeight : AppDimensions.h(fallbackSize)),
            width: size ?? (constraints.maxWidth != 0.0 ? constraints.maxWidth : AppDimensions.w(fallbackSize)),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(Icons.broken_image, size: AppDimensions.h(30)),
          );
        },
      ),
    );
  }
}
