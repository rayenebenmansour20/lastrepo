
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
       GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('RayeneBen'),//nom du profil
          actions: <Widget>[
            Center(
              child:TextButton(
              style: TextButton.styleFrom(foregroundColor:Colors.blue), 
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
        Icons.shopping_cart,
        color: Colors.black,
        size: 22,
      ),
      Positioned(
        top: 0,
        right: 2,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 4,
        ),
      ),
    ],
  ),
)
),
SizedBox(width: 5,),
        GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hello'),
          content: Text('You tapped the image!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
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
SizedBox(width: 5,),
          GestureDetector(
          onTap: () async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Select an image'),
                  content: _imageUrl != null
                      ? Image.network(_imageUrl!)
                      : Text('No image selected'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Gallery'),
                      onPressed: () async {
                        await _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Camera'),
                      style: TextButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.blue
                      ),
                      onPressed: () async {
                        await _pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
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
                : AssetImage("assets/images/rayeneben.png"),
            child: Stack(
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


// ignore: camel_case_types
/*class notificationicon extends StatelessWidget{
  const notificationicon({
    super.key,
    int counter =0,
  });
  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
      IconButton(
        onPressed: (){
          debugPrint('Notificationbar');
        } ,
        icon:Stack(
          children:<Widget>[
            CircleAvatar(
            radius:100,  
            backgroundColor:Colors.white,
            child:Icon(Icons.notifications,
            color:Colors.black)),
            Positioned(
              left:16,
              bottom: 15,
              child: Icon(Icons.brightness_1 ,
              color:Colors.red,
              size:9))
          ]
        ),), 
      ],
    );
  }
}*/