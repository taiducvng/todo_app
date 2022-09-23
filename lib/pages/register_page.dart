import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:go_moon/pages/home_page.dart';

import 'package:go_moon/widgets/custom_button.dart';

class RegisterPage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  String buttonName = 'Sign in';
  Key _formKey = GlobalKey<FormState>();
  RegisterPage({Key? key}) : super(key: key);

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
                  _pageTitle(),
                  _bookRideWidget(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
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

  Widget _bookRideWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: _deviceHeight * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  child: TextField(
                    decoration: CustomInputDecoration()
                        .textInputDecoration('Email', ''),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: TextField(
                    decoration: CustomInputDecoration()
                        .textInputDecoration('Full Name', ''),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: TextField(
                    obscureText: true,
                    decoration: CustomInputDecoration()
                        .textInputDecoration1('Password', ''),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  child: TextField(
                    obscureText: true,
                    decoration: CustomInputDecoration()
                        .textInputDecoration1(' conffirm Password', ''),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  decoration:
                      CustomInputDecoration().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: CustomInputDecoration().buttonStyle(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 360),
                      child: Text(
                        'Sign up'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //child: Text('Don\'t have an account? Create'),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: " have an account? ",
                        ),
                        TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
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
