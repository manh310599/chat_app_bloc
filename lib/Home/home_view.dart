import 'package:app_chat_bloc/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      _auth.signOut();
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
        return MyApp();
      },));
    },child: Center(
      child: Text('ok'),
    ));
  }
}
