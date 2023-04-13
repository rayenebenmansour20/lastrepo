
import 'package:newapp/components/commandespage/list.dart';
import 'package:newapp/components/header.dart';
import 'package:newapp/components/top_referal.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'analyticscommandes_cards.dart';


class CommandesContent extends StatefulWidget {
  const CommandesContent({Key? key}) : super(key: key);
  
  @override
  _CommandesContentState createState()=> _CommandesContentState(); 
}

class _CommandesContentState extends State<CommandesContent>{
  bool _showBarChart = true;

  void _toggleChart(){
    setState((){
      _showBarChart = ! _showBarChart;
    }
    );
  }


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
                          const AnalyticcommandeCards(),
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
                          const SizedBox(height:appPadding),              
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if(!Responsive.isMobile(context))
                                 const Expanded(
                                  flex: 5,
                                 child: 
                                   Commandeliste(),
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
              ],
            ),

          ],
        ),
      ),
    );
  }
}


