import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/constants/constants.dart';
import 'package:colours/colours.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _anotherInputController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  Uint8List? _selectedImageBytes;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _anotherInputController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _anotherInputController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

   Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),     
            const SizedBox(height:8),
            Container(
              width: appPadding * 12,
              height: appPadding * 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _selectedImageBytes != null ? null : Colours.aliceBlue,
              ),
              child: GestureDetector(
        onTap: _pickImage,
        child: _selectedImageBytes == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset(
        'assets/images/addpicture.png', // Replace with your image path
        width: 50,
        height: 50,
        color: Colors.black,
          ),
              const SizedBox(height: 8),
              const Text(
                'Upload your',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'photo',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.memory(
              _selectedImageBytes!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
      ),
            ),
            const SizedBox(height: 16),
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: Colours.aliceBlue,
                      labelText: 'First Name',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _anotherInputController,
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: Colours.aliceBlue,
                      labelText: 'Another Input',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled:true,
                      fillColor: Colours.aliceBlue,
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 8),
             const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneNumberController,
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colours.aliceBlue,
                labelText: 'Phone Number',
                border:  const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[ 
              ElevatedButton(
              onPressed: () {
                      // Handle button press here
              },
              style: ElevatedButton.styleFrom(
                
                      backgroundColor: Colors.blue, // Set the background color of the button
                      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
                      ),
              ),
              child: const Text(
                      'Sauvegarder',
                      style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
                      ),
              ),
                      ),
                      const SizedBox(width:appPadding),
                      ElevatedButton(
              onPressed: () {
                      // Handle button press here
                      Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                
                      backgroundColor: Colors.white, // Set the background color of the button
                      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
                      ),
              ),
              child: const Text(
                      'Annuler',
                      style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
                      ),
              ),
                      ),
                      ],
                      ),
                    ),
            )
      
          ],
        ),
      ),
    );
  }
}
