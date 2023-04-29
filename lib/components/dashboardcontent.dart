
import 'package:newapp/components/vented%C3%A9tails.dart';
import 'package:newapp/components/header.dart';
import 'package:newapp/components/top_referal.dart';
import 'package:newapp/components/viewers.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';
import 'analytic_cards.dart';


class DashboardContent extends StatefulWidget {
  const DashboardContent({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _DashboardContentState createState()=> _DashboardContentState(); 
}

class _DashboardContentState extends State<DashboardContent>{
  bool _showBarChart = true;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            const Header(),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const AnalyticCards(),
                          const SizedBox(
                            height: appPadding,
                          ),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: appPadding,
                            ),
                        ],
                      ),
                    ),

                    if (!Responsive.isMobile(context))
                      const SizedBox(
                        width: appPadding,
                       ),
                  ],
                ),
               Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: appPadding,
                          ),
                          ToggleButtons(
                                    isSelected: [_showBarChart, !_showBarChart],
                                     borderColor: Colors.blue,
                                     borderRadius: BorderRadius.circular(4),
                                     onPressed: (int index) {
                                     setState(() {
                                    _showBarChart = index == 0;
                                      });
                                   },
                                    children: const [
                                     Icon(Icons.show_chart),
                                     Icon(Icons.group)
                                        ]),
                          const SizedBox(height:appPadding),              
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(!Responsive.isMobile(context))
                                 Expanded(
                                  flex: 5,
                                  child: _showBarChart
                                  ? const BarChartSample3()
                                  : const TopReferals(),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: appPadding,
                          ),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: appPadding,
                            ),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      const SizedBox(
                        width: appPadding,
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: appPadding,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(!Responsive.isMobile(context))
                                const Expanded(
                                  flex: 2,
                                  child: TopReferals(),
                                ),
                              if(!Responsive.isMobile(context))
                                const SizedBox(width: appPadding,),
                              const Expanded(
                                flex: 3,
                                child: Viewers(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: appPadding,
                          ),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context)) const TopReferals(),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: appPadding,
                            ),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      const SizedBox(
                        width: appPadding,
                      ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


