
import 'package:newapp/components/vented%C3%A9tails.dart';
import 'package:newapp/components/header.dart';
import 'package:newapp/components/product_card.dart';
import 'package:newapp/components/product_info_card.dart';
import 'package:newapp/components/top_referal.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';

class ProductContent extends StatefulWidget {
  const ProductContent({Key? key}) : super(key: key);
  
  @override
  _ProductContentState createState()=> _ProductContentState(); 
}

class _ProductContentState extends State<ProductContent>{
  bool _showBarChart = true;

  void _toggleChart(){
    setState((){
      _showBarChart = ! _showBarChart;
    }
    );
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [
              const Header(),
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                  children:[ 
                    const Text(
                        'Produits',
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ) ),
                        const Spacer(),
                        SizedBox(
                          height: 30,
                        child: ToggleButtons(
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
                                        ]),),
                  const SizedBox(width:appPadding),  
                 SizedBox(
  height: 30,
  child: ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Input 1'),
                    subtitle: Text('Description of input 1'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle input 1 tap
                    },
                  ),
                  ListTile(
                    title: Text('Input 2'),
                    subtitle: Text('Description of input 2'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle input 2 tap
                    },
                  ),
                  ListTile(
                    title: Text('Input 3'),
                    subtitle: Text('Description of input 3'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle input 3 tap
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
    style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all<Color>(Colors.white),
    ),
    child: const Text(
      'Filtrer',
      style: TextStyle(color: Colors.black),
    ),
  ),
),
 
                     const SizedBox(width: appPadding,),
                  ],), 
                  const SizedBox(height: appPadding,),     
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            if(_showBarChart)
                            const ProductCards(),
                            if(!_showBarChart)
                            const TopReferals(),
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
                  /*const Row(
                    children: [
                      Expanded(
                      child:Column(
                        children: [
                          Row(
                            children:[
                            Text(
                              'A Découvrir',
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                            )
                            ],
                          ),
                          Row(

                          )
                        ],
                      ),
                      ),
                    ],
                  )*/
                ],
              ),
            ],
          ),
        ),
        );
      
  }
}


