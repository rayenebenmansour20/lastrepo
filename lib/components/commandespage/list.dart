import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'listdetail.dart';

class Commandeliste extends StatefulWidget {
  const Commandeliste({Key? key}) : super(key: key);

  @override
  _CommandelisteState createState() => _CommandelisteState();
}

class _CommandelisteState extends State<Commandeliste> {
  int _currentPage = 0;
  final int _perPage = 30;

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
      height: 500,
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
                'Produits en faible quantité',
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
                    style: TextStyle(
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
          Expanded(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: paginatedData.length,
              itemBuilder: (context, index) => commandelisteDetail(
                info: paginatedData[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}




List<ReferalInfoModel> referalData = [
  ReferalInfoModel(
    title: "Coca-Cola",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Javel Doz",
    count: 234,
    svgSrc: "assets/icons/home.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Pepsi",
    count: 234,
    svgSrc: "assets/icons/menu_doc.svg",
    color: primaryColor,
  ),

  ReferalInfoModel(
    title: "Mayonnaise",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ), ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/media.svg",
    color: red,
  ),
  
  
];