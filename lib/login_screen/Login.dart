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
  var _signin=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenUtil= Dynamicscreenutil(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _signin,
          child: Stack(
            children: [
              Column(

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
                            controller: user_controller,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              label: Text("Username",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
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
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Column(
                      children: [
                        Container(
                          width: screenUtil.sizewidth(0.9),
                          child: TextFormField(
                            controller: pass_controller,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,color: Colors.grey,),
                              label: Text("Password",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                              hintText: "Password",
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
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 380,
                          child: Container(child: ElevatedButton(onPressed: () {

                          }, child: Text("Sign In",style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)


                          ),


                          ),
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
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                        children: [
                          TextSpan(
                            text: "\nUsername",
                            style: TextStyle(
                              fontSize: 14.33,
                              color: Colors.black,
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
              Padding(
                padding:  const EdgeInsets.symmetric(vertical: 394,horizontal: 24),
                child: Row(
                  children: [
                    Text("Password",style: TextStyle(
                      fontSize: 14.33,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,

                    ),),
                  ],
                ),
              ),


            
          ],
             
          ),
        ),
      ),

    );
  }
}
