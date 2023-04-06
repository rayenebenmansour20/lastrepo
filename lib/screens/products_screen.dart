import 'package:newapp/components/productcontent.dart';
import 'package:flutter/material.dart';



import '../constants/constants.dart';
import '../constants/responsive.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) 
            const Expanded(
              flex: 5,
              child: ProductContent(),
            )
          ],
        ),
      ),
    );
  }
}