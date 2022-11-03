import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:flutter/material.dart';
import './login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  bool isClicked = false;

  AuthMethods _authMethods = AuthMethods();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  void register() async {
    setState(() {
      isClicked = !isClicked;
    });
    String response = await _authMethods.registerMethod(
        email: _emailController.text,
        name: _nameController.text,
        phone: _phoneController.text,
        password: _passwordController.text);
    if (response == 'success') {
      Navigator.pushReplacementNamed(context, '/home');
      return;
    }
    setState(() {
      isClicked = !isClicked;
    });
    showSnackbar(response, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register1.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacer(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 35),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          spacer(height: 70),
                          TextInputField(
                              placeholder: 'Name',
                              borderColor: kPrimarySwatch,
                              controller: _nameController),
                          spacer(
                            height: 30,
                          ),
                          TextInputField(
                              placeholder: 'Email',
                              borderColor: kPrimarySwatch,
                              controller: _emailController),
                          spacer(
                            height: 30,
                          ),
                          TextInputField(
                            placeholder: 'Phone',
                            borderColor: kPrimarySwatch,
                            controller: _phoneController,
                          ),
                          spacer(
                            height: 40,
                          ),
                          TextInputField(
                            placeholder: 'Password',
                            borderColor: kPrimarySwatch,
                            controller: _passwordController,
                          ),
                          spacer(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700),
                              ),
                              isClicked? CircularProgressIndicator(): CircleAvatar(
                                radius: 30,
                                backgroundColor: kPrimarySwatch,
                                child: IconButton(
                                    color: kWhiteColor,
                                    onPressed: register,
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
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
                                  Navigator.pushNamed(context, 'login');
                                  // Navigator.of(context).push(_createRoute());
                                },
                                child: const Text(
                                  'Already A User? Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const MyLogin(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }
