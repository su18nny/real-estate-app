import 'package:flutter/material.dart';
import 'package:real_estateui/constants/images.dart';
import 'package:real_estateui/login_screen/Login_screen.dart';
import '../constants/screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginState();
}

class _LoginState extends State<SignupScreen> {
  TextEditingController user_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();

  bool passwordVisible = true;
  var _signup = GlobalKey<FormState>();

  void isSign() {
    final _isValid = _signup.currentState!.validate();
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
            key: _signup,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenUtil.sizehieght(0.3),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImagePaths.gharForSale),
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
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22, bottom: 16, top: 0),
                            child: Row(
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 14.33,
                                    height: 0.1,
                                    color: Color(0xFF091130),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenUtil.sizewidth(0.9),
                            child: TextFormField(
                              obscureText: passwordVisible,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                if (pass_controller.text.length < 6) {
                                  return "Enter 6 digits password";
                                }
                                return null;
                              },
                              controller: pass_controller,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                  icon: passwordVisible
                                      ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.red,
                                  )
                                      : Icon(
                                    Icons.visibility,
                                    color: Color(0xFF6A6A6A),
                                  ),
                                ),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Color(0xFF6A6A6A),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22, bottom: 16, top: 40),
                            child: Row(
                              children: [
                                Text(
                                  "Email Address",
                                  style: TextStyle(
                                    fontSize: 14.33,
                                    height: 0.1,
                                    color: Color(0xFF091130),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: screenUtil.sizewidth(0.9),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                  return "Please Enter Correct Email";
                                }
                                return null;
                              },
                              controller: email_controller,
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF6A6A6A),
                                ),
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
                      padding: const EdgeInsets.only(left: 0, top: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 52,
                            width: 375,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                                isSign();

                              },
                              child: Text(
                                "Sign up",
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
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFF616161),
                                    endIndent: 5,
                                    indent: 25,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                      color: Color(0xFF616161),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1,
                                    color: Color(0xFF616161),
                                    endIndent: 25,
                                    indent: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImagePaths.Google, height: 22),
                                SizedBox(width: 18),
                                Image.asset(ImagePaths.Facebook, height: 22),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 228, horizontal: 24),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Sign Up',
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
                                height: 3.80,
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
