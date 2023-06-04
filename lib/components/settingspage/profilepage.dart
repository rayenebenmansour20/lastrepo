import 'package:flutter/material.dart';
import 'package:newapp/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../provider/db_provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> userData = {};
  
   Future<String>? etat;

   Future<String> verifetat(DatabaseProvider databaseProvider) async {
    final res = await databaseProvider.getUserData();
    if (res['is_active'] == true) {
      return 'Actif';
    } else {
      return 'Inactif';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final databaseProvider =Provider.of<DatabaseProvider>(context, listen: false);
      etat = verifetat(databaseProvider).then((value) {
        setState(() {
          etat = Future.value(value); // Initialize etat with the resolved value
        });
        return value;
      });
      databaseProvider.getUserData().then((data) {
        setState(() {
          userData = data;
        });
      });
    });
      }


  @override
  Widget build(BuildContext context) {
    final nom = userData['username'] ?? 'default_url';
    final role = userData['MUTPROFID'] != null
        ? userData['MUTPROFID']['MPRLIBLONG']
        : 'default_name';
    String utisphoto = userData['MUTPHOTOS'].toString();

    final email = userData['email'] ?? 'default_email';
    final datedebut = userData['date_joined'] ?? 'default_date';
    final derniereconex = userData['last_login'] ?? 'default_date';
    final sessioncle = userData['session_key'] ?? 'default_session';
    final code = userData['MUTUTLEXT'] ?? 'default_code';

    List<UserInfo> userInfos = [
      UserInfo('Email', email, Icons.email),
      UserInfo('Date Debut', datedebut, Icons.calendar_today),
      UserInfo('Derniere Connexion', derniereconex, Icons.access_time),
      UserInfo('Session Cle', sessioncle, Icons.vpn_key),
      UserInfo('Code', code, Icons.code),
      UserInfo('Code', code, Icons.code),
      UserInfo('Code', code, Icons.code),
      UserInfo('Code', code, Icons.code),

      

    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // first column
            Expanded(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 130,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(utisphoto),
                    ),
                  ),
                  const SizedBox(height: appPadding),
                  Text(
                    nom,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    role,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                    ),
                  ),
                  if (etat != null)
                    FutureBuilder<String>(
                      future: etat!,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style:const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text(
                          'Error',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    )
                ],
              ),
            ),
            const SizedBox(width: 20),
            // second column
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: userInfos.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 70, 
                    child: Card(
                      child: ListTile(
                        leading: Icon(userInfos[index].icon),
                        title: Text(userInfos[index].name),
                        subtitle: Text(userInfos[index].value),
                      ),
                    ),
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

class UserInfo {
  final String name;
  final String value;
  final IconData icon;

  UserInfo(this.name, this.value, this.icon);
}
