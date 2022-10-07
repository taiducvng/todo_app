import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_app/pages/login_page.dart';

import 'package:todo_app/widgets/custom_button.dart';

// ignore: must_be_immutable
class RegisterPage1 extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  final Key _formKey = GlobalKey<FormState>();
  RegisterPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _iconImage(),
                  _signUpFormWidget(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconImage() {
    return Container(
      height: _deviceHeight * 0.45,
      width: _deviceWidth * 0.45,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/image.png"),
        ),
      ),
    );
  }

  Widget _signUpFormWidget(BuildContext context) {
    return SizedBox(
      height: _deviceHeight * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  decoration:
                      CustomInputDecoration().textInputDecoration('Email', ''),
                ),
                const SizedBox(height: 15.0),
                TextField(
                  decoration: CustomInputDecoration()
                      .textInputDecoration('Full Name', ''),
                ),
                const SizedBox(height: 15.0),
                TextField(
                  obscureText: true,
                  decoration: CustomInputDecoration()
                      .textInputDecoration1('Password', ''),
                ),
                const SizedBox(height: 15.0),
                TextField(
                  obscureText: true,
                  decoration: CustomInputDecoration()
                      .textInputDecoration1(' conffirm Password', ''),
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: 34,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [(Color(0xffF79E89)), Color(0xffF2861E)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //child: Text('Don\'t have an account? Create'),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: " have an account? ",
                        ),
                        TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
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
    );
  }
}
