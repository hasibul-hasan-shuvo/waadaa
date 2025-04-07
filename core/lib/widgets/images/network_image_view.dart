import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/assets/app_images.dart';
import 'package:core/assets/dimens.dart';
import 'package:core/widgets/images/asset_image_view.dart';
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadiusAll = Dimens.radiusZero,
    this.borderRadiusTopLeft = Dimens.radiusZero,
    this.borderRadiusTopRight = Dimens.radiusZero,
    this.borderRadiusBottomLeft = Dimens.radiusZero,
    this.borderRadiusBottomRight = Dimens.radiusZero,
    this.placeHolder = AppImages.placeholder,
    this.fit = BoxFit.contain,
  });

  final String imageUrl;
  final double borderRadiusAll;
  final double borderRadiusTopLeft;
  final double borderRadiusTopRight;
  final double borderRadiusBottomLeft;
  final double borderRadiusBottomRight;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          borderRadiusAll != Dimens.radiusZero
              ? borderRadiusAll
              : borderRadiusTopLeft,
        ),
        topRight: Radius.circular(
          borderRadiusAll != Dimens.radiusZero
              ? borderRadiusAll
              : borderRadiusTopRight,
        ),
        bottomLeft: Radius.circular(
          borderRadiusAll != Dimens.radiusZero
              ? borderRadiusAll
              : borderRadiusBottomLeft,
        ),
        bottomRight: Radius.circular(
          borderRadiusAll != Dimens.radiusZero
              ? borderRadiusAll
              : borderRadiusBottomRight,
        ),
      ),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => AssetImageView(
          fileName: placeHolder,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
        errorWidget: (context, url, error) => AssetImageView(
          fileName: placeHolder,
          fit: BoxFit.cover,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
