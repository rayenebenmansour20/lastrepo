
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/components/settingspage/settingcontent.dart';
import 'package:newapp/provider/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: appPadding),
      child: const Row(
        children: [
          Expanded(
            child: SearchField(),
          ),
          SizedBox(width: appPadding,),
          Ticketicon(),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
              padding: const EdgeInsets.all(appPadding * 0.75),
              margin: const EdgeInsets.symmetric(horizontal: appPadding / 2),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SvgPicture.asset("./assets/icons/Search.svg")),
        ),
      ),
    );
  }
}

class Ticketicon extends StatefulWidget {
  const Ticketicon({
    super.key,
    int counter = 0,
  });

  @override
  State<Ticketicon> createState() => _TicketiconState();
}

class _TicketiconState extends State<Ticketicon> {
    bool showSettingsTile = false;

    String? _imageUrl;
    
    
  @override
  void initState() {
    super.initState();
    _loadImageUrl();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('image_url', pickedFile.path);
      setState(() {
        _imageUrl = pickedFile.path;
      });
    }
  }

  Future<void> _loadImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageUrl = prefs.getString('image_url');
    });
  }

  void _navigateToSettingsPage() {
  /*setState(() {
    var selectedIndex = 6;
  });*/
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) =>  const SettingsContent()),
  );
}


  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
       GestureDetector(
  onTap: () async {
    final dbProvider = Provider.of<DatabaseProvider>(context, listen: false);
    final token = await dbProvider.getToken();
    final userData = await DatabaseProvider().getUserData();

    if (token.isNotEmpty) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(20),
            child: FractionallySizedBox(
              widthFactor: 0.3,
              heightFactor: 0.4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage('${userData['MUTPHOTOS']}'),
                      radius: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${userData['username']}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${userData['MUTPROFID']['MPRLIBLONG']}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color:Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            style: TextButton.styleFrom(foregroundColor: Colors.white),
                            onPressed: _navigateToSettingsPage,
                            child: const Text('Consulter mon profil'),
                           ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  },
  child: FutureBuilder<Map<String, dynamic>>(
    future: DatabaseProvider().getUserData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While waiting for the future to complete, you can show a loading indicator or placeholder
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // If an error occurs, you can show an error message
        return Text('Error: ${snapshot.error}');
      } else {
        // If the future completes successfully, you can access the user data from the snapshot
        final userData = snapshot.data;

        return CircleAvatar(
          backgroundImage: NetworkImage('${userData?['MUTPHOTOS']}'),
          radius: 20,
        );
      }
    },
  ),
),

const SizedBox(width: 5,),
        GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hello'),
          content: const Text('You tapped the image!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  },
   child: const CircleAvatar(
  backgroundColor: appcolors.grey1,
  radius:20,
  child: Stack(
    alignment: Alignment.center,
    children: [
      Icon(
        Icons.notifications,
        color: Colors.black,
        size: 22,
      ),
      Positioned(
        top: 0,
        right: 4,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 4,
        ),
      ),
    ],
  ),
)
),
const SizedBox(width: 5,),
          GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Select an image'),
                  content: _imageUrl != null
                      ? Image.network(_imageUrl!)
                      : const Text('No image selected'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Gallery'),
                      onPressed: () async {
                        await _pickImage(ImageSource.gallery);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.blue
                      ),
                      onPressed: () async {
                        await _pickImage(ImageSource.camera);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: const Text('Camera'),
                    ),
                  ],
                );
              },
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.white30,
            radius: 20,
            backgroundImage: _imageUrl != null
                ? NetworkImage(_imageUrl!) as ImageProvider
                : const AssetImage("assets/images/rayeneben.png"),
            child: const Stack(
              children: [
                Positioned(
                  right: 1,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
