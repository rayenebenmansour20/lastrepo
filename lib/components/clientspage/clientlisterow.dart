


import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ClientListHeaderRow extends StatelessWidget {
  const ClientListHeaderRow({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width:appPadding),
        Expanded(
          child: SizedBox(
            height: 15,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width:appPadding),
        Expanded(
          child: SizedBox(
            height: 15,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Count',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width:appPadding),
        Expanded(
          child: SizedBox(
            height: 15,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width:appPadding),
        Expanded(
          child: SizedBox(
            height: 15,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Quantity',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

