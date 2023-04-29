

import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newapp/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import 'analyticsclient_cards.dart';
import 'listclient.dart';


class ClientContent extends StatefulWidget {
  const ClientContent({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _ClientContentState createState()=> _ClientContentState(); 
}

class _ClientContentState extends State<ClientContent>{
  
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
                        'Clients',
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
  child: Row(
    children: [
    ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Input 1'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter input 1',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: appPadding,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Input 2'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter input 2',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Input 3'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter input 3',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width:appPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Input 4'),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter input 4',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center buttons horizontally
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle blue button tap
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: const Text('Blue Button'),
                      ),
                      const SizedBox(width: appPadding,),
                      OutlinedButton(
                        onPressed: () {
                          // Handle white button tap
                        },
                        child: const Text('White Button'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  child: const Text(
    'Nouveau client',
    style: TextStyle(color: Colors.white),
  ),
),



      const SizedBox(width:appPadding),
       ElevatedButton(
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
          'Trier',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ],
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
                          const AnalyticclientCards(),
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
                                   Clientliste(),
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


