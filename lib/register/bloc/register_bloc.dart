import 'dart:async';

import 'package:app_chat_bloc/register/bloc/register.event.dart';
import 'package:app_chat_bloc/register/bloc/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   FirebaseAuthException? e;
  RegisterBloc() : super(Register_Initial_State()) {
    on<RegisterConfirm_Event>((event, emit) => register(event, state),);
  }
  static const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);


  FutureOr<void> register(RegisterConfirm_Event event, RegisterState state) async {

    if (event.email.isEmpty ||
        event.disPlayName.isEmpty ||
        event.password.isEmpty ||
        event.comfirmPass.isEmpty) {
      emit(Register_FieldlNull());
      emit(Unknow());
    }
    else if (event.password.length <6 || event.comfirmPass.length< 6 ){
      emit(Register_ConfirmPass_ToShort());
      emit(Unknow());
    }
    else  if (event.password != event.comfirmPass)
      {
        emit(Register_ConfirmPass_Wrong());
        emit(Unknow());
      }

    else {

      final information = <String,dynamic>{
        'email':event.email,
        'name': event.disPlayName,
        'image': '',
        'firt_check': true,
        'day_of_birth': '',
        'sex': '',
        'address':'',
      };

      try {
       await _auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
       await _firestore.collection('user').doc(_auth.currentUser!.uid).set(information);
        emit(Resgister_Success());
      } catch(e){
        emit(Register_Email_Invaid());
        emit(Unknow());
      }
    }
  }
}
