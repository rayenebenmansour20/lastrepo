import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
//cv chwiya 
class ReferalInfoModel {
  final String? svgSrc, title;
  final int? count;
  final Color? color;
  final int? quantite;
  final String? categorie;

  ReferalInfoModel({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
    this.quantite,
    this.categorie,
  });
}

class ReferalInfoDetail extends StatelessWidget {
  const ReferalInfoDetail({Key? key, required this.info}) : super(key: key);

  final ReferalInfoModel info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(appPadding / 1.5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: info.color!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              info.svgSrc!,
              // ignore: deprecated_member_use
              color: info.color!,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    info.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                  Text(
                    '${info.count!}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}