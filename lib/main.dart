import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
