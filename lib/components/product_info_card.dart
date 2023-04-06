import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProductInfo {
  final Icon? svgSrc;
  final String? title;
  final int? count;
  final Color? color;
  final Image? image;

  ProductInfo({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
    this.image,
  });
}

class ProductInfoCard extends StatefulWidget {
  const ProductInfoCard({Key? key, required this.info}) : super(key: key);

  final ProductInfo info;

  @override
  State<ProductInfoCard> createState() => _ProductInfoCardState();
}

class _ProductInfoCardState extends State<ProductInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(appPadding / 2),
            height: 80,
            width: 80,
            child: widget.info.image,
          ),
          const SizedBox(width: appPadding / 2),
          Expanded(
            child: Text(
              widget.info.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

