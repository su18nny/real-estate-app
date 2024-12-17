import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/login_screen/Login_screen.dart';
import '../constants/screenutil.dart';

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
        // widget.imgUrl=null;
      }else{
        print("No Image Picked");
      }
    });
  }
  TextEditingController user_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

  bool passwordVisible = true;
  var _signin = GlobalKey<FormState>();

  void isLogin() {
    final _isValid = _signin.currentState!.validate();
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
            key: _signin,
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
            SizedBox(height: 35,),
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 350, horizontal: 24),
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
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
