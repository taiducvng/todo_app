// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_app/api/api_service.dart';
import 'package:todo_app/model/login_model.dart';

import 'package:todo_app/pages/forgot_password.dart';
import 'package:todo_app/pages/register_page.dart';
import 'package:todo_app/pages/testing_page.dart';
// import 'package:todo_app/widgets/custom_button.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late double _deviceHeight, _deviceWidth;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  get scaffoldKey => GlobalKey<ScaffoldState>();
  late LoginRequestModel loginRequestModel;
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel(password: '', email: '');
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(24),
          // height: _deviceHeight,
          // width: _deviceWidth,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _logoImage(),
                  _loginFormWidget(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoImage() {
    return Container(
      height: _deviceHeight * 0.35,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/images/Union.png"),
        ),
      ),
    );
  }

  Widget _loginFormWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (input) => loginRequestModel.email = input!,
                  validator: (input) =>
                      !input!.contains('@') ? "Email Id should be valid" : null,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  onSaved: (input) => loginRequestModel.password = input!,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: const BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.0),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.4),
                      icon: Icon(hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      APIService apiService = APIService();
                      apiService.loginAPI(emailController.text.toString(),
                          passwordController.text.toString());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage1()));
                    }
                  },
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
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  //child: Text('Don\'t have an account? Create'),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                        ),
                        TextSpan(
                          text: 'Create',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
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

  // bool validateAndSave() {
  //   final form = globalFormKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
