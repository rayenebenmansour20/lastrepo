// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

class Notificationspage extends StatefulWidget{
  const Notificationspage({Key? key}) : super(key: key);

  @override
  _NotificationspageState createState() => _NotificationspageState();
}


class _NotificationspageState extends State<Notificationspage> {
  bool toggleValue = false;

  final List<NotificationCard> _listOfNotification = [
    // your list items...
    NotificationCard(
      date: DateTime.now(),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 1',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 2',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 10),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 3',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 30),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 4',
      subtitle: 'We believe in the power of mobile computing.',
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 44),
      ),
      leading: const Icon(
        Icons.account_circle,
        size: 48,
      ),
      title: 'OakTree 5',
      subtitle: 'We believe in the power of mobile computing.',
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold (
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedContainer (
                  duration: const Duration(milliseconds: 1000),
                  height: 40.0,
                  width: 100.0,
                  decoration: BoxDecoration (
                    borderRadius: BorderRadius.circular(20.0),
                    color: toggleValue ? Colors.greenAccent[100] : Colors.redAccent[100]?.withOpacity(0.5),
                  ),
                  child: Stack (
                    children: <Widget>[
                      AnimatedPositioned (
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeIn,
                        top: 3.0,
                        left: toggleValue ? 60.0 : 0.0,
                        right: toggleValue ? 0.0 : 60.0,
                        child: InkWell(
                          onTap: toggleButton,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1000),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return ScaleTransition(child: child, scale: animation);
                            },
                            child: toggleValue ? Icon(Icons.check_circle, color: Colors.green, size: 35.0, key: UniqueKey()) :
                            Icon(Icons.remove_circle_outline, color: Colors.red, size: 35.0, key: UniqueKey()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            StackedNotificationCards(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 2.0,
                ),
              ],
              notificationCardTitle: 'Message',
              notificationCards: [..._listOfNotification],
              cardColor: const Color(0xFFF1F1F1),
              padding: 16,
              actionTitle: const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showLessAction: const Text(
                'Show less',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTapClearAll: () {
                setState(() {
                  _listOfNotification.clear();
                });
              },
              clearAllNotificationsAction: const Icon(Icons.close),
              clearAllStacked: const Text('Clear All'),
              cardClearButton: const Text('clear'),
              cardViewButton: const Text('view'),
              onTapClearCallback: (index) {
                print(index);
                setState(() {
                  _listOfNotification.removeAt(index);
                });
              },
              onTapViewCallback: (index) {
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  toggleButton(){
    setState(() {
      toggleValue = !toggleValue;
    });
  }
}



