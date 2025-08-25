import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";

class ImageLoader extends StatelessWidget {
  const ImageLoader({
    super.key,
    this.height,
    this.width = double.infinity,
    required this.url,
    BorderRadius? borderRadius,
    Icon? icon,
  }) :
        borderRadius = borderRadius ?? const BorderRadius.all(Radius.circular(16)),
        icon = icon ?? const Icon(
            Icons.error,
            color: Colors.black38,
            size: 32
        );

  final double? height;
  final double width;
  final BorderRadius borderRadius;
  final Icon icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: width,
          height: height,
          color: Colors.black12,
          child: CachedNetworkImage(
            imageBuilder: (BuildContext context, ImageProvider url) {
              return Image(
                image: url,
                fit: BoxFit.cover,
              );
            },
            imageUrl: url,
            errorWidget: (BuildContext context, String url, dynamic error) {
              return Center(
                  child: icon
              );
            },
            progressIndicatorBuilder: (BuildContext context, String url, DownloadProgress progress) {
              return const Center(
                  child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )
                  )
              );
            },
            fit: BoxFit.cover,
          ),
        )
    );
  }
}
