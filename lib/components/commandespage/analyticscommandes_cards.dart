import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'analyticscommandesinfo_card.dart';

class AnalyticcommandeCards extends StatelessWidget {
  const AnalyticcommandeCards({Key? key}) : super(key: key);

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
      itemBuilder: (context, index) => AnalyticInfocommandeCard(
        info: analyticData[index],
      ),
    );
  }
}

List analyticData = [
  AnalyticcommandeInfo(
    title: "Total commandes",
    count: 720,
    svgSrc: const Icon(Icons.abc_rounded),
    color: primaryColor,
  ),

  AnalyticcommandeInfo(
    title: "Commandes payés",
    count: 820,
    svgSrc: const Icon(Icons.post_add),
    color:Colors.red,
  ),
  AnalyticcommandeInfo(
    title: "Commandes non payés",
    count: 920,
    svgSrc: const Icon(Icons.pages),
    color: orange,
  ),
  
];
