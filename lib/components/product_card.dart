import 'package:newapp/components/product_info_card.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';
import 'productcarddetails.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({Key? key}) : super(key: key);

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  int _currentPage = 0;
  final int _totalPages = 2; // Assuming we have a total of 48 items

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: _buildAnalyticInfoCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: _buildAnalyticInfoCardGridView(),
      desktop: _buildAnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 2.4 : 3,
      ),
    );
  }

  Widget _buildAnalyticInfoCardGridView({
    int crossAxisCount = 4,
    double childAspectRatio = 2,
  }) {
    // Calculate the start and end index of the current page
    int startIndex = _currentPage * 24;

    // Get the items to display on the current page
    List<ProductInfo> items = analyticData
        .skip(startIndex)
        .take(24)
        .toList()
        .cast<ProductInfo>();

    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: appPadding,
            mainAxisSpacing: appPadding,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              print("rayene");
                /* Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ProductDetailsScreen(product: items[index]),
    ),
  );*/
            },
            child: ProductInfoCard(
              info: items[index],
            ),
          ),
        ),
        SizedBox(height: appPadding),
        _buildPagination(),
      ],
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: _currentPage == 0
              ? null
              : () {
                  setState(() {
                    _currentPage--;
                  });
                },
        ),
        Text('${_currentPage + 1} / $_totalPages'),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: _currentPage == _totalPages - 1
              ? null
              : () {
                  setState(() {
                    _currentPage++;
                  });
                },
        ),
      ],
    );
  }
}
int ID=0;
List<ProductInfo> analyticData = [
  ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
    image: Image.asset("assets/images/javel-doz.png"),
    id:ID++,
  ),
  ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
    id:ID++,
  ),
  ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),
  ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),
ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),
  ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),ProductInfo(
    title: "Produit 1",
    count: 720,
    svgSrc: const Icon(Icons.people),
    color: primaryColor,
  ),
  // Add the rest of the items here
];

