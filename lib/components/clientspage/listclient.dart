


import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../data/model/client.dart';
import '../../provider/client_provider.dart';

class Clientliste extends StatefulWidget {
  const Clientliste({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClientlisteState createState() => _ClientlisteState();
}

class _ClientlisteState extends State<Clientliste> {
  int _currentPage = 0;
  int? selectedTarif;

  
  final int _perPage = 30;
  final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController tarifprodController = TextEditingController();
final TextEditingController identcardController = TextEditingController();


  ClientProvider getClientProvider(BuildContext context) {
    return Provider.of<ClientProvider>(context, listen: false);
  }


  void showDeleteConfirmationDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Client'),
        content: const Text('Are you sure you want to delete this client?'),
        actions: [
          TextButton(
            onPressed: () {
              // Perform delete action here
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

void showEditDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Client'),
        content: const Text('Edit client details here.'),
        actions: [
          TextButton(
            onPressed: () {
              // Perform edit action here
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getClientProvider(context).fetchClients().then((clients) {
        if(mounted){
        setState(() {
          clientData = clients.map((json) => Client.fromJson(json)).toList();
        });
        }
      });
    });
  }

  
  void showClientDetails(Client client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Client Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('First Name: ${client.firstName}'),
              Text('Last Name: ${client.lastName}'),
              Text('Email: ${client.email}'),
              Text('Phone Number: ${client.phoneNumber}'),
              Text('Tarif: ${client.tarifprod}'),
              Text('Identifiant: ${client.identcard}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  List<Client> getPaginatedData() {
    final int startingIndex = _currentPage * _perPage;
    final int endingIndex = startingIndex + _perPage;
    return clientData.sublist(startingIndex, endingIndex.clamp(0, clientData.length));
  }

  @override
  Widget build(BuildContext context) {
    final List<Client> paginatedData = getPaginatedData();
    final int totalPages = (clientData.length / _perPage).ceil();
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
                'Clients',
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
              GestureDetector(
                onTap: () {
            },
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                   /* child: Image.asset(
                      info.svgSrc!,
                      width: 12,
                      height: 12,
                    ),*/
                  ),
                  const SizedBox(width: 8),
                  Text(
                    info.firstName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
              ),
            ),
            DataCell(
              Text(
                '${info.id!}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            DataCell(
              GestureDetector(
                onTap: () {
            },
              child: Text(
                info.lastName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              ),
            ),
            DataCell(
              Text(
                info.lastName!,
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
  color: Colors.red,
  onPressed: () async {
    // Assuming 'clientId' is the id of the client to delete
    String? error = await Provider.of<ClientProvider>(context, listen: false).deleteClient(info.id!);
    
    if (error == null) {
      print("Client deleted successfully");
    } else {
      print("Failed to delete client: $error");
    }
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
                  'Modifier ce client',
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
                                controller: lastNameController,
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
                                controller: firstNameController,
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
                                controller: emailController,
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
                                controller: phoneNumberController,
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
                               DropdownButtonFormField<int>(
  decoration: const InputDecoration(labelText: 'Choisissez un tarif'),
  value: selectedTarif,
  items: const [
    DropdownMenuItem(
      child: Text("VIP"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("Passager"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("Normal"),
      value: 3,
    ),
  ],
  onChanged: (value) {
    setState(() {
      selectedTarif = value;
    });
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
                                controller: identcardController,
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
                           Client updatedClient = Client(
      id: info.id,  // Assuming 'client' is the existing client data
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      tarifprod: selectedTarif,
      isvalid: true,
      userid: '36',  // If tarifprod is an integer
      identcard: identcardController.text,
      // Add other properties here...
    );
    String? error = await Provider.of<ClientProvider>(context, listen: false)
        .updateClient(updatedClient);
         if (error == null) {
      Navigator.of(context).pop();
      print("Client updated successfully");
    } else {
      print("Failed to update client: $error");
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
              showClientDetails(info);
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


List<Client> clientData = [];
