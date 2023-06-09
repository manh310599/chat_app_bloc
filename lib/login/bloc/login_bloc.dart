import 'dart:async';

import 'package:app_chat_bloc/login/bloc/login_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class  LoginBloc extends Bloc<Login_Event,loginState>{
  LoginBloc() : super(Unknow()){
    on<LoginConfirmEvent>((event, emit) => Login(event, state));
  }

  final information = <String,dynamic>{

    'firt_check': false,

  };

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FutureOr<void> Login (LoginConfirmEvent event,loginState state) async {
    if (event.email.isEmpty || event.pass.isEmpty)
      {
        emit(emailIsNull());
        emit(Unknow());
      }
    else {
      try{
       await _auth.signInWithEmailAndPassword(email: event.email, password: event.pass);
       //await _firestore.collection('user').doc(_auth.currentUser!.uid).update(information);
       emit(loginSuccessFulState());
      }catch(e){
        emit(loginFaildState());
        emit(Unknow());
      }

    }
  }


}