import 'package:app_chat_bloc/Home/home_view.dart';
import 'package:app_chat_bloc/information/information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/widget/login_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _authStatus = FirebaseAuth.instance;


  final _fireStore = FirebaseFirestore.instance;

  Future<bool>? readField() async {
    // Lấy dữ liệu của tài liệu có ID là 'document_id' từ collection 'users'

    final documentSnapshot = await _fireStore
        .collection('user')
        .doc(_authStatus.currentUser?.uid)
        .get();

    // Kiểm tra xem tài liệu có tồn tại hay không
    if (documentSnapshot.exists) {
      // Truy cập trường 'field_name' và trả về giá trị của nó
      final fieldValue = documentSnapshot.get('firt_check');

      return fieldValue;

    } else {
      // Trường hợp tài liệu không tồn tại
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {

    readField();

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        builder: (context, snapshot) {

         return Scaffold(

              body: _authStatus.currentUser == null
              ? LoginHome()
              : snapshot.data == false ? HomeView(): Information());
        },
        future: readField(),


        ),
      );

  }
}

