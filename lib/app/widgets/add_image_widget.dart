import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddImagePlaceholder extends StatelessWidget {
  final Uint8List? image;
  final Function? onTap;
  final String? title;

  const AddImagePlaceholder({Key? key, this.image, this.onTap, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap!();
          },
          child: image!.length > 1
              ? Image.memory(
                  image!,
                  width: 35.w,
                  height: 35.w,
                )
              : Image.asset(
                  'assets/icons/ic_add_photo.png',
                  width: 35.w,
                  height: 35.w,
                ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title!,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}

class AddImagePlaceholderWithEdit extends StatelessWidget {
  final Uint8List? image;
  final Function? onTap;
  final String? title;
  final String? imageLink;

  const AddImagePlaceholderWithEdit(
      {Key? key, this.image, this.onTap, this.title, this.imageLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap!();
          },
          child: imagePlaceholder(),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title!,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }

  Widget imagePlaceholder() {
    if (image!.isNotEmpty) {
      return SizedBox(
        width: 38.w,
        height: 38.w,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 2.w, bottom: 2.w),
              child: Image.memory(
                image!,
                width: 35.w,
                height: 35.w,
              ),
            ),
            Image.asset(
              'assets/icons/ic_edit_photo.png',
              width: 5.w,
              height: 5.w,
            ),
          ],
        ),
      );
    } else {
      if (imageLink!.isNotEmpty) {
        return SizedBox(
          width: 38.w,
          height: 38.w,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 2.w, bottom: 2.w),
                child: CachedNetworkImage(
                  width: 35.w,
                  height: 35.w,
                  fit: BoxFit.fill,
                  imageUrl: imageLink!,
                  placeholder: (context, url) => Image.asset(
                    'assets/images/loading.gif',
                    fit: BoxFit.fill,
                    width: 35.w,
                    height: 35.w,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Image.asset(
                'assets/icons/ic_edit_photo.png',
                width: 5.w,
                height: 5.w,
              ),
            ],
          ),
        );
      } else {
        return Image.asset(
          'assets/icons/ic_add_photo.png',
          width: 35.w,
          height: 35.w,
        );
      }
    }
  }
}
