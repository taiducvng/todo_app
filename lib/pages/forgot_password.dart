import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_button.dart';

class HomePage2 extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  String buttonName = 'Sign in';
  final Key _formKey = GlobalKey<FormState>();
  HomePage2({Key? key}) : super(key: key);

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
                  _formWidget(context),
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
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/image.png"),
        ),
      ),
    );
  }

  Widget _formWidget(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: _deviceHeight * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 10, 20),
                  alignment: Alignment.topRight,
                ),
                Container(
                  child: TextField(
                    decoration: CustomInputDecoration()
                        .textInputDecoration1('Password', ''),
                  ),
                ),
                SizedBox(height: 15.0),
                TextField(
                  obscureText: true,
                  decoration: CustomInputDecoration()
                      .textInputDecoration1('Confirm password', ''),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 30, 10, 20),
                  alignment: Alignment.topRight,
                ),
                Container(
                  decoration:
                      CustomInputDecoration().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: CustomInputDecoration().buttonStyle(),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 360),
                      child: Text(
                        'Sign In'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {},
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
