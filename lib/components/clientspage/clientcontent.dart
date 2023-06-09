

import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:newapp/components/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../data/model/client.dart';
import '../../provider/client_provider.dart';
import 'analyticsclient_cards.dart';
import 'listclient.dart';


class ClientContent extends StatefulWidget {
  const ClientContent({Key? key}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _ClientContentState createState()=> _ClientContentState(); 
}

class _ClientContentState extends State<ClientContent>{
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();
  final TextEditingController input5Controller = TextEditingController();  
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
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();
      return Dialog(
        insetPadding: const EdgeInsets.all(20), // Add some padding to reduce the dialog size
        child: FractionallySizedBox(
          widthFactor: 0.5,
          heightFactor: 0.65,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
                children: [
                  const Text(
                    'Nouveau Client',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Nom'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: input1Controller,
                                  decoration: const InputDecoration(
                                    hintText: 'Saisissez le nom',
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
                                const Text('Prénom'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: input2Controller,
                                  decoration: const InputDecoration(
                                    hintText: 'Saisissez le prénom',
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
                                const Text('Email'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: input3Controller,
                                  decoration: const InputDecoration(
                                    hintText: "Saisissez lemail",
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
                                const Text('N° de téléphone'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: input4Controller,
                                  decoration: const InputDecoration(
                                    hintText: "Saisissez le numéro de téléphone",
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
                                const Text('Tarif'),
                                const SizedBox(height: 8),
                                 MultiSelectFormField(
                      title: const Text('Choisissez un tarif'),
                      dataSource: const [
              {'display': 'VIP', 'value': '1'},
              {'display': 'Passager', 'value': '2'},
              {'display': 'Normal', 'value': '3'},
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'Annuler',
                      //hintText: 'Select inputs',
                      initialValue: const [], // set initial value here
                      onSaved: (value) {
              // Handle selected inputs
                      },
                    ),
                              ],
                            ),
                          ),
                          const SizedBox(width:appPadding),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('N° de carte fidelité'),
                                const SizedBox(height: 8),
                                TextFormField(
                                  controller: input5Controller,
                                  decoration: const InputDecoration(
                                    hintText: "Saisissez le numéro",
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
                  // ... Keep the existing input fields and SizedBoxes ...
                  const SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:1,
                        child: ElevatedButton(
                          onPressed: () async {
  // Retrieve the values from the input fields
            String firstName = input1Controller.text;
            String lastName = input2Controller.text;
            String email = input3Controller.text;
            String phoneNumber = input4Controller.text;
            String identcard = input5Controller.text;
  
  // Create a new Client object with the retrieved values
  Client newClient = Client(
    firstName: firstName,
    lastName: lastName,
    email: email,
    phoneNumber: phoneNumber,
    identcard: identcard,
    isvalid: true,
    tarifprod: 1,
    userid: '36',
  );
  
  // Call the addClient method from the ClientProvider
  String? errorMessage = await Provider.of<ClientProvider>(context, listen: false)
      .addClient(newClient);
  
  // Handle the result of adding the client
  if (errorMessage == null) {
    Navigator.of(context).pop();
    WidgetsBinding.instance.scheduleFrame();


    // Perform any additional actions or show a success message
  } else {
    // Failed to add the client
    // Handle the error, such as displaying an error message
  }
},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: const Text('Blue Button'),
                        ),
                        ),
                        const SizedBox(width: appPadding * 2),
                        Expanded(
                          flex:1, // Increase space between the buttons
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle white button tap
                          },
                          child: const Text('White Button'),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            {'display': 'VIP', 'value': '1'},
            {'display': 'Passager', 'value': '2'},
            {'display': 'Fidèle', 'value': '3'},
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


