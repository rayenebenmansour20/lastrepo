

import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newapp/components/commandespage/list.dart';
import 'package:newapp/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../provider/db_provider.dart';
import 'analyticscommandes_cards.dart';


class CommandesContent extends StatefulWidget {
  const CommandesContent({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _CommandesContentState createState()=> _CommandesContentState(); 
}

class _CommandesContentState extends State<CommandesContent>{
  // navigate to CommandesContent
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            const Header(),
              Row(
                  children:[ 
                    const Text(
                        'Commandes',
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ) ),
                        const Spacer(),
                        const SizedBox(
                          height: 30,),
                  const SizedBox(width:appPadding),  
                 SizedBox(
  height: 30,
  child: ElevatedButton.icon(
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
    icon:const Icon(
      Icons.menu_book,
      color:Colors.black,
    ),
    label: const Text(
      'Trier',
      style: TextStyle(color: Colors.black),
    ),
  ),
),
                     const SizedBox(width: appPadding,),
                  ],),
                  const SizedBox(height:appPadding),
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


