


import 'package:flutter/material.dart';
import 'package:newapp/components/clientspage/listclientdetail.dart';
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
  final int _perPage = 30;

  ClientProvider getClientProvider(BuildContext context) {
    return Provider.of<ClientProvider>(context, listen: false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getClientProvider(context).fetchClients().then((clients) {
        setState(() {
          clientData = clients.map((json) => Client.fromJson(json)).toList();
        });
      });
    });
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
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: paginatedData.length,
              itemBuilder: (context, index) =>ClientlisteDetailDataTable(
                info: [paginatedData[index]],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Client> clientData = [];
