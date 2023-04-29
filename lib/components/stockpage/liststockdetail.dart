import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class ReferalInfoModel {
  final String? svgSrc, title;
  final int? count;
  final Color? color;
  final int? quantite;
  final String? categorie;

  ReferalInfoModel({
    this.svgSrc,
    this.title,
    this.count,
    this.color,
    this.quantite,
    this.categorie,
  });
}

class StocklisteDetailDataTable extends StatelessWidget {
  const StocklisteDetailDataTable({Key? key, required this.info}) : super(key: key);

  final List<ReferalInfoModel> info;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Title')),
        DataColumn(label: Text('Count')),
        DataColumn(label: Text('Category')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: info.map((info) {
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
          ],
        );
      }).toList(),
    );
  }
}
