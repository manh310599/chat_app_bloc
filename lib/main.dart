import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/widget/login_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authStatus = FirebaseAuth.instance;

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _authStatus.currentUser == null
            ? LoginHome()
            : Text('yes'),

      ),
    );
  }
}
