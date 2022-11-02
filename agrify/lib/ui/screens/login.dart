import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  bool isClicked = false;
  void login() async {
    setState(() {
      isClicked = !isClicked;
    });
    String response = await _authMethods.loginMethod(
      email: emailController.text,
      password: passwordController.text,
    );
    if (response == 'success') {
      Navigator.pushNamed(context, '/home');
    }
    showSnackbar(response, context);
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login3.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome Back',
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                    ),
                  ),
                ],
                onTap: () {},
              ),
              // child: Text(
              //   'Welcome\nBack',
              //   style: TextStyle(color: Colors.white, fontSize: 33),
              // ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextInputField(
                            placeholder: 'E-mail',
                            borderColor: kPrimarySwatch,
                            controller: emailController,
                          ),
                          spacer(
                            height: 30,
                          ),
                          TextInputField(
                            placeholder: 'Password',
                            borderColor: kPrimarySwatch,
                            controller: passwordController,
                          ),
                          spacer(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: kPrimarySwatch,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: login,
                                  icon: isClicked
                                      ? const CircularProgressIndicator(
                                          color: kWhiteColor,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward,
                                        ),
                                ),
                              )
                            ],
                          ),
                          spacer(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
