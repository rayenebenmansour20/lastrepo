import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/client_provider.dart';

class ClientListScreen extends StatelessWidget {
  const ClientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context, listen: false);
    clientProvider.fetchClients();
    return Scaffold(
      body: Consumer<ClientProvider>(
        builder: (context, provider, child) {
          if (provider.clients.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.clients.length,
              itemBuilder: (context, index) {
                final client = provider.clients[index];
                return ListTile(
                  title: Text('${client.firstName} ${client.lastName}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
