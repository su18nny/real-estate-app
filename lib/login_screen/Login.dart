import 'package:flutter/material.dart';
import 'package:real_estateui/constants/images.dart';

import '../constants/screenutil.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user_controller=TextEditingController();
  TextEditingController pass_controller=TextEditingController();

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

    //praveen suthar
    final screenUtil= Dynamicscreenutil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _signin,
            child: Stack(

              children: [

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenUtil.sizehieght(0.3) ,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImagePaths.gharForSale),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 42),
                      child: Column(
                        children: [
                          Container(
                            width: screenUtil.sizewidth(0.9),
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
                                prefixIcon: Icon(Icons.person,color: Color(0xFF6A6A6A),),
                                label: Text("Username",style: TextStyle(color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600),),
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
                      padding:  EdgeInsets.symmetric(vertical: 0),
                      child: Column(


                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22,bottom: 18),
                            child: Row(
                              children: [
                                Text("Password",style: TextStyle(
                                  fontSize: 14.33,
                                  height: 0.1,
                                  color: Color(0xFF091130),
                                  fontWeight: FontWeight.w500,

                                ),),
                              ],
                            ),
                          ),

                          Container(
                            width: screenUtil.sizewidth(0.9),
                            child: TextFormField(
                              obscureText:passwordVisible ,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Enter Password";
                                }if(pass_controller.text.length<6){
                                  return "Enter 6 digits password";
                                }
                                return null;
                              },
                              controller: pass_controller,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  }
                                  );
                                }, icon: passwordVisible
                                    ? Icon(Icons.visibility_off,color: Colors.red,)
                                    :Icon(Icons.visibility,color: Color(0xFF6A6A6A),)),
                                label: Text("Password",style: TextStyle(color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600),),
                                hintText:"Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(Icons.key,color: Color(0xFF6A6A6A),),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 52,
                            width: 372,
                            child: Container(child: ElevatedButton(onPressed: () {
                              isLogin();
                            }, child: Text("Sign In",style: TextStyle(color: Colors.white,letterSpacing: 1,fontWeight: FontWeight.w500),),
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF006EFF))
                            ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 30),
                            child: Row(
                              children: [

                                Expanded(
                                  child: Divider(thickness: 1,color: Color(0xFF616161),endIndent: 5,indent: 25,),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text('Or continue with',style: TextStyle(color: Color(0xFF616161),fontWeight: FontWeight.w600),),
                                ),
                                Expanded(
                                  child: Divider(thickness: 1,color: Color(0xFF616161),endIndent: 25,indent: 5,),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(ImagePaths.Google, height: 22),
                              SizedBox(width: 10), // Added space between the images
                              Image.asset(ImagePaths.Facebook, height: 22),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 228,horizontal: 24),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF091130),
                            letterSpacing: 1,
                          ),
                          children: [
                            TextSpan(
                              text: "\nUsername",
                              style: TextStyle(
                                fontSize: 14.33,
                                color: Color(0xFF091130),
                                fontWeight: FontWeight.w500,
                                height: 3.80
                              ),
                            )
                          ],
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

    );
  }
}
