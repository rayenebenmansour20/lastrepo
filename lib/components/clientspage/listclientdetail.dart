import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../data/model/client.dart';



// ignore: camel_case_types
class ClientlisteDetailDataTable extends StatefulWidget {
  const ClientlisteDetailDataTable({Key? key, required this.info}) : super(key: key);

  final List<Client> info;

  @override
  State<ClientlisteDetailDataTable> createState() => _ClientlisteDetailDataTableState();
}

// ignore: camel_case_types
class _ClientlisteDetailDataTableState extends State<ClientlisteDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Title')),
        DataColumn(label: Text('Count')),
        DataColumn(label: Text('Category')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('actions')),
      ],
      rows: widget.info.map((info) {
        return DataRow(
          cells: [
            DataCell(
  Row(
    children: [
      Text(
        '${info.id}!',
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
                info.firstName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
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
              Text(
                info.email!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
