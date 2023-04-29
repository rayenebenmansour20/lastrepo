import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AnalyticcommandeInfo {
  final Icon? svgSrc;
  final String? title;
  final int? count;
  final Color? color;

  AnalyticcommandeInfo({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
  });
}

class AnalyticInfocommandeCard extends StatelessWidget {
  const AnalyticInfocommandeCard({Key? key, required this.info, this.color}) : super(key: key);

  final AnalyticcommandeInfo info;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      decoration: BoxDecoration(
        color: info.color ?? secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Align(
            alignment: Alignment.center,
          child:Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(
                "${info.count}",
                style: const TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
