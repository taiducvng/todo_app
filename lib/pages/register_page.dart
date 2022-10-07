import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:todo_app/api/api_service.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/pages/testing_page.dart';

import '../model/register_model.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late double _deviceHeight, _deviceWidth;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  get scaffoldKey => GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool hidePassword = true;
  late RegisterRequestModel registerRequestModel;
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
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  onSaved: (input) => registerRequestModel.name = input!,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: "Full name",
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
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (input) => registerRequestModel.email = input!,
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
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  onSaved: (input) => registerRequestModel.password = input!,
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
                TextFormField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  onSaved: (input) =>
                      registerRequestModel.age = input!.toString() as int?,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "Age",
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
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      var apiService = APIService();

                      apiService.registerAPI(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          ageController.text.toString());
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
