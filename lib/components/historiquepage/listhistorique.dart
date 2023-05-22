
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';                                         
import '../../data/model/client.dart';
import '../../provider/client_provider.dart';
import 'listhistoriquedetail.dart';



class Historiqueliste extends StatefulWidget {
  const Historiqueliste({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HistoriquelisteState createState() => _HistoriquelisteState();
}

class _HistoriquelisteState extends State<Historiqueliste> {
  int _currentPage = 0;
  final int _perPage = 30;
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  final TextEditingController input3Controller = TextEditingController();
  final TextEditingController input4Controller = TextEditingController();

  List<ReferalInfoModel> getPaginatedData() {
    final int startingIndex = _currentPage * _perPage;
    final int endingIndex = startingIndex + _perPage;
    return referalData.sublist(startingIndex, endingIndex.clamp(0, referalData.length));
  }

  @override
  Widget build(BuildContext context) {
    final List<ReferalInfoModel> paginatedData = getPaginatedData();
    final int totalPages = (referalData.length / _perPage).ceil();
    final bool canGoForward = paginatedData.length == _perPage;

    return Container(
      height: 700,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Histrique',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              
              Row(
                children: [
                  IconButton(
                    onPressed: _currentPage == 0
                        ? null
                        : () {
                            setState(() {
                              _currentPage--;
                            });
                          },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _currentPage == 0
                          ? textColor.withOpacity(0.5)
                          : textColor,
                    ),
                  ),
                  Text(
                    '${_currentPage + 1} / $totalPages',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: !canGoForward
                        ? null
                        : () {
                            setState(() {
                              _currentPage++;
                            });
                          },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: !canGoForward
                          ? textColor.withOpacity(0.5)
                          : textColor,
                    ),
                  ),
                ],
              ),
             
            ],
          ),
          const SizedBox(
            height: appPadding,
          ),
          // Header Row
          Expanded(
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
  child: SizedBox(
    width:MediaQuery.of(context).size.width,
    child: DataTable(
      columns: const [
        DataColumn(label: Text('Title')),
        DataColumn(label: Text('Count')),
        DataColumn(label: Text('Category')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text(''))
      ],
      rows: paginatedData.map<DataRow>((info) {
        return DataRow(
          cells: [
            DataCell(
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      info.svgSrc!,
                      width: 12,
                      height: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    info.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            DataCell(
              Text(
                '${info.count!}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            DataCell(
              Text(
                info.categorie!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            DataCell(
              Text(
                '${info.quantite!}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            DataCell(
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red, // Icon to edit
            onPressed: () {
              },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.blueAccent, // Icon to edit
           onPressed: () {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: const EdgeInsets.all(20), // Add some padding to reduce the dialog size
        child: FractionallySizedBox(
          widthFactor: 0.4,
          heightFactor: 0.65,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
              children: [
                const Text(
                  'Supprimer ce client',
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
                                //controller: input1Controller,
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
                               // controller: input2Controller,
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
                               // controller: input3Controller,
                                decoration: const InputDecoration(
                                  hintText: "Saisissez lemail",
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
                              const Text('N° de téléphone'),
                              const SizedBox(height: 8),
                              TextFormField(
                               // controller: input4Controller,
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
                        const SizedBox(width: appPadding,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('N° de carte fidelité'),
                              const SizedBox(height: 8),
                              TextFormField(
                               // controller: input6Controller,
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
                           //Handle blue button tap
                           Client newClient = Client(
                           firstName: input1Controller.text,
                           lastName: input2Controller.text,
                           email: input3Controller.text,
                           phoneNumber: input4Controller.text,
                           );
                           // Access your ClientProvider
    ClientProvider clientProvider = Provider.of<ClientProvider>(context, listen: false);

    // Add the new client to your server
    String? errorMessage = await clientProvider.addClient(newClient);

     //Check if there was an error
    if (errorMessage != null) {
      print('Failed to add client: $errorMessage');
    } else {
      print('Successfully added client!');
      // Clear the TextEditingControllers
      input1Controller.clear();
      input2Controller.clear();
      input3Controller.clear();
      input4Controller.clear();

      // Close the dialog
      Navigator.of(context).pop();
    }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: const Text('Valider'),
                      ),
                      ),
                      const SizedBox(width: appPadding * 2),
                      Expanded(
                        flex:1, // Increase space between the buttons
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle white button tap
                          Navigator.of(context).pop();

                        },
                        child: const Text('Annuler'),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
},
          ),
          IconButton(
            icon: const Icon(Icons.visibility),
            color:Colors.blueAccent, // Icon to view data
            onPressed: () {
              // Implement your viewing logic here
            },
          ),
        ],
      ),
    ),
          ],
        );
      }).toList(),
    ),
  ),
            )
),

        ],
      ),
    );
  }
}




List<ReferalInfoModel> referalData = [
  ReferalInfoModel(
    title: "Coca-Cola",
    count: 234,
    svgSrc: "assets/images/javel-doz.png",
    color: primaryColor,
    categorie: "Sport",
    quantite: 56,
  )
];