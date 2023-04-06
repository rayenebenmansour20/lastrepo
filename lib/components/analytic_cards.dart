import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';
import 'analytic_info_card.dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key? key}) : super(key: key);

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
    this.crossAxisCount = 4,
    this.childAspectRatio = 2,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: appPadding,
        mainAxisSpacing: appPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => AnalyticInfoCard(
        info: analyticData[index],
      ),
    );
  }
}

List analyticData = [
  AnalyticInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Produit 2",
    count: 820,
    svgSrc: const Icon(Icons.post_add),
    color: purple,
  ),
  AnalyticInfo(
    title: "Produit 3",
    count: 920,
    svgSrc: const Icon(Icons.pages),
    color: orange,
  ),
  AnalyticInfo(
    title: "Produit 4",
    count: 920,
    svgSrc: const Icon(Icons.comment),
    color: green,
  ),
];
