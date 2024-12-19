import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/login_screen/Login_screen.dart';
import '../constants/screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _LoginState();
}

class _LoginState extends State<ProfileScreen> {

  File ? _image;
  final picker=ImagePicker();

  Future getImageGallery() async{
    final pickedFile=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80,);
    setState(() {
      if(pickedFile!= null){
        _image=File(pickedFile.path);

      }else{
        print("No Image Picked");
      }
    });
  }
  TextEditingController user_controller = TextEditingController();
  final List<String> emaillist=[
    'user1@gmail.com',
    'user2@gmail.com',
    'user3@gmail.com',
  ];
  String? selectedEmail;

  var _profile  = GlobalKey<FormState>();

  void iscomplete() {
    final _isValid = _profile.currentState!.validate();
    if (_isValid) {
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenUtil = Dynamicscreenutil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _profile,
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                  Container(
                  width: screenUtil.sizewidth(1),
              height: screenUtil.sizehieght(0.1),
                  ),
                        SizedBox(height: 25),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Complete Your Profile',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text('Don’t worry, only you ca see your personal\ndata. No one else will be able to see it.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          ),SizedBox(height: 35,),
            InkWell(
              onTap: () {
                getImageGallery();
              },
              child: Stack(
                children: [
                  Container(
                    width: 119,
                    height: 119,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: Color(0xffb000929),
                    ),
                    child: _image != null
                        ? ClipOval(
                      child: Image.file(
                        _image!.absolute,
                        fit: BoxFit.cover,
                        width: 119,
                        height: 119,
                      ),
                    )
                        : Center(
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Color(0xffbF9FBFF),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        getImageGallery();
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
                        Container(width: screenUtil.sizewidth(0.9),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username cannot be empty.";
                              }
                              if (!RegExp(r'^[a-zA-Z]+@[0-9]+$').hasMatch(value)) {
                                return "Invalid username format. Use letters@numbers.";
                              }
                              return null;
                            },
                            controller: user_controller,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF6A6A6A),
                              ),
                              hintText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),SizedBox(height: 55,),
                        Container(width: screenUtil.sizewidth(0.9),
                          child: IntlPhoneField(
                            initialCountryCode: 'IN',
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF6A6A6A),
                              ),
                              hintText: "Enter Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 38,),
                        Container(width: screenUtil.sizewidth(0.9),
                          child:DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            hint: Text("Select",textAlign: TextAlign.center,),
                            value: selectedEmail,
                            items: emaillist.map((String email) {
                              return DropdownMenuItem<String>(
                                value: email,
                                child: Text(email),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedEmail = value;
                              });
                            },
                            validator: (value) => value == null ? 'Please select an email' : null,
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox( height: 52,
                          width: 375,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                              iscomplete();

                            },
                            child: Text(
                              "Complete Profile",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF006EFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 360, horizontal: 24),
                    child: Row(
                      children: [
                        Text("Name",
                          style: TextStyle(
                            fontSize:14.33,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF091130),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 472, horizontal: 24),
                    child: Row(
                      children: [
                        Text("Phone Number",
                          style: TextStyle(
                            fontSize:14.33,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF091130),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 588, horizontal: 24),
                    child: Row(
                      children: [
                        Text("Email Address",
                          style: TextStyle(
                            fontSize:14.33,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF091130),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
