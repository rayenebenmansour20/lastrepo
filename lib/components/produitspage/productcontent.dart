
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newapp/components/produitspage/listproduit.dart';
import 'package:newapp/components/header.dart';
import 'package:newapp/components/produitspage/product_card.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';

class ProductContent extends StatefulWidget {
  const ProductContent({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _ProductContentState createState()=> _ProductContentState(); 
}

class _ProductContentState extends State<ProductContent>{
  bool _showBarChart = true;



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
    constraints: const BoxConstraints(maxWidth: 300),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MultiSelectFormField(
          title: const Text('Select inputs'),
          dataSource: const [
            {'display': 'Input 1', 'value': 'input_1'},
            {'display': 'Input 2', 'value': 'input_2'},
            {'display': 'Input 3', 'value': 'input_3'},
          ],
          textField: 'display',
          valueField: 'value',
          okButtonLabel: 'OK',
          cancelButtonLabel: 'CANCEL',
          //hintText: 'Select inputs',
          initialValue: const [], // set initial value here
          onSaved: (value) {
            // Handle selected inputs
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Trier'),
              onPressed: () {
                // Handle OK button tap
              },
            ),
            const SizedBox(width:8),
            ElevatedButton(
              onPressed: () {
                // Handle CANCEL button tap
              },
              style: ElevatedButton.styleFrom(
               backgroundColor:Colors.white),
              child: const Text('Annuler',style: TextStyle(color: Colors.black),),
            ),
          ],
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
                            const Produitliste(),
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


