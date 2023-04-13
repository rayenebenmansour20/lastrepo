import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newapp/components/commandespage/commandesview.dart';
import 'package:newapp/components/dashboardcontent.dart';
import 'package:newapp/components/productcontent.dart';
import 'package:newapp/components/commandespage/commandesview.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const DashboardContent();
        break;
      case 1:
        page = const ProductContent();
        break;
      case 2:
        page = const CommandesContent();
        break;
      case 3:
        page = const Placeholder();
        break;
      case 4:
        page = const Placeholder();
        break;
      case 5:
        page = const Placeholder();
        break;
      case 6:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: Drawer(
                backgroundColor: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DrawerHeader(
                        child: Image.asset(
                          "./assets/images/datamasterlogo.png",
                          width: 100,
                          height: 100,
                        ),
                      ),
                      DrawerListTile(
                        title: "Dashboard",
                        svgSrc: "./assets/icons/home.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        selected: selectedIndex == 0,
                      ),
                      DrawerListTile(
                        title: "Produits",
                        svgSrc: "./assets/icons/product.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        selected: selectedIndex == 1,
                      ),
                      DrawerListTile(
                        title: "Commandes",
                        svgSrc: "./assets/icons/order.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        selected: selectedIndex == 2,
                      ),
                      DrawerListTile(
                        title: "Clients",
                        svgSrc: "./assets/icons/useravatar.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 3;
                          });
                        },
                        selected: selectedIndex == 3,
                      ),
                      DrawerListTile(
                        title: "Stock",
                        svgSrc: "./assets/icons/icons8-box-128.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 4;
                          });
                        },
                        selected: selectedIndex == 4,
                      ),
                      DrawerListTile(
                        title: "Historique",
                        svgSrc: "./assets/icons/menu_dashbord.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 5;
                          });
                        },
                        selected: selectedIndex == 5,
                      ),
                      const SizedBox(height: 100),
                      DrawerListTile(
                        title: "Paramètres",
                        svgSrc: "./assets/icons/settings.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 6;
                          });
                        },
                        selected: selectedIndex == 6,
                      ),
                      DrawerListTile(
                        title: "Déconnexion",
                        svgSrc: "./assets/icons/loginout.svg",
                        press: () {
                          setState(() {
                            selectedIndex = 7;
                          });
                        },
                        selected: selectedIndex == 7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Scaffold(
                body:page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.selected = false,
  });

  final String title, svgSrc;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        color: selected ? Colors.blue : Colors.white,
        child: ListTile(
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            // ignore: deprecated_member_use
            color: selected ? Colors.white : Colors.blue,
            height: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.blue,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
