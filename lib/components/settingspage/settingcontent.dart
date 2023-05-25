import 'package:colours/colours.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newapp/components/header.dart';
import 'package:flutter/material.dart';
import 'package:newapp/components/settingspage/Notificationspage.dart';
import 'package:newapp/components/settingspage/profilepage.dart';

import '../../constants/constants.dart';
import 'editprofile.dart';
import 'Notificationspage.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
    var selectedIndex = 0;
      final _pageController = PageController(initialPage: 0); // add this line


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
            padding: EdgeInsets.only(top:appPadding,left:appPadding,right:appPadding),
            child: Header(),
            ),
            const Padding(
              padding:  EdgeInsets.only(left:appPadding),
              child: Text(
                'Paramètres',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Expanded(
  flex: 1,
  child: Padding(
    padding: const EdgeInsets.all(appPadding),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Drawer(
                backgroundColor: Colors.white,
                child: ListView(
                  children: [
                    const SizedBox(height:appPadding),
                    DrawerListTile(
                      title: "Profil",
                      svgSrc: "./assets/icons/useravatar.svg",
                      press: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      pageController: _pageController,
                      index:0,
                      selected: selectedIndex == 0,
                    ),
                    DrawerListTile(
                      title: "Modifier Profil",
                      svgSrc: "./assets/icons/edit-svgrepo-com.svg",
                      press: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      pageController: _pageController,
                      index:1,
                      selected: selectedIndex == 1,
                    ),
                    DrawerListTile(
                      title: "Notifications",
                      svgSrc: "./assets/icons/notifications1.svg",
                      press: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      pageController: _pageController,
                      index:2,
                      selected: selectedIndex == 2,
                    ),
                    DrawerListTile(
                      title: "Langue",
                      svgSrc: "./assets/icons/globe1.svg",
                      press: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                      pageController: _pageController,
                      index: 3,
                      selected: selectedIndex == 3,
                    ),
                    DrawerListTile(
                      title: "Aide",
                      svgSrc: "./assets/icons/help2.svg",
                      press: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                      },
                      pageController: _pageController,
                      index: 4,
                      selected: selectedIndex == 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(appPadding),
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 200, // specify the minimum width
                  maxWidth: 500, // specify the maximum width
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return  UserProfile();
                    } else if (index == 1) {
                      return const ProfileSettingsPage();
                    } else if  (index == 2) {
                      return const  Notificationspage();
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}



class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.pageController,
    required this.index, // Add a PageController parameter
    this.selected = false,
  });

  final String title, svgSrc;
  final VoidCallback press;
  final PageController pageController;
  final bool selected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        press();
         pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        color: selected ? Colours.aliceBlue : Colors.white,),
        child: ListTile(
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            // ignore: deprecated_member_use
            color: selected ? Colors.black : const Color.fromARGB(255, 210, 210, 210),
            height: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.black : const Color.fromARGB(255, 210, 210, 210),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
