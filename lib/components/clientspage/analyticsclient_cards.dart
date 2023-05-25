import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../provider/client_provider.dart';
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
    this.crossAxisCount = 4,
    this.childAspectRatio = 3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, clientProvider, _) {
        int vipCount = clientProvider.getVipCount();
        int passagerCount = clientProvider.getPassagerCount();
        int normalCount = clientProvider.getNormalCount();

        List<AnalyticclientInfo> analyticData = [
          AnalyticclientInfo(
            title: "Total clients",
            count: clientProvider.clients.length,
            svgSrc: const Icon(Icons.abc_rounded),
            color: const Color.fromARGB(255, 238, 194, 142),
          ),
          AnalyticclientInfo(
            title: "VIP",
            count: vipCount,
            svgSrc: const Icon(Icons.vpn_key),
            color: const Color(0xFFADD8E6),
          ),
          AnalyticclientInfo(
            title: "Passagers",
            count: passagerCount,
            svgSrc: const Icon(Icons.flight),
            color: const Color(0xFFFFB6C1),
          ),
          AnalyticclientInfo(
            title: "Normal",
            count: normalCount,
            svgSrc: const Icon(Icons.person),
            color: const Color(0xFFC9A0DC),
          ),
        ];

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: analyticData.length,
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
      },
    );
  }
}
