import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'analyticsclientinfo_card.dart';

class AnalyticclientCards extends StatelessWidget {
  const AnalyticclientCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AnalyticInfoCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const AnalyticInfoCardGridView(),
      desktop: AnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 2.4 : 3,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  const AnalyticInfoCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoclientCard(
        info: analyticData[index],
      ),
    );
  }
}

List analyticData = [
  AnalyticclientInfo(
    title: "Total clients",
    count: 720,
    svgSrc: const Icon(Icons.abc_rounded),
    color: const Color.fromARGB(255, 238, 194, 142),
  ),

  AnalyticclientInfo(
    title: "Hommes",
    count: 820,
    svgSrc: const Icon(Icons.post_add),
    color:const Color(0xFFADD8E6),
  ),
  AnalyticclientInfo(
    title: "Femmes",
    count: 920,
    svgSrc: const Icon(Icons.pages),
    color: const Color(0xFFFFB6C1),
  ),
  
];
