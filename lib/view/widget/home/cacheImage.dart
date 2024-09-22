import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/imgaeasset.dart';

class CustomCacheImage extends StatelessWidget {
  final String imageUrl;
  const CustomCacheImage({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      placeholder: (context, url) => Image.asset(AppImageAsset.logo),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
