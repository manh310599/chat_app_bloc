import 'dart:async';

import 'package:app_chat_bloc/register/bloc/register.event.dart';
import 'package:app_chat_bloc/register/bloc/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RegisterBloc() : super(Register_Initial_State()) {}

  FutureOr<void> register_Confirm_Event(RegisterConfirm_Event event,
      Emitter<RegisterState> emit) async {
    final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('chat_app');
    final QuerySnapshot snapshot =
    await userCollection.where('phone', isEqualTo: event.phone).get();
    if (!snapshot.docs.isEmpty) {
      emit(Register_PhoneExisted_State());
      return;
    } else if (event.password != event.comfirmPass) {
      emit(Register_ConfirmPassDontSame_State());
      return;
    }

    var model = await _auth.verifyPhoneNumber(
      phoneNumber: "${event.phone}",
      verificationCompleted: (PhoneAuthCredential credenial) async {
        await _auth.signInWithCredential(credenial).then(
              (value) {

          },
        );
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          add(Register_InvalidPhoneNumber_Event());
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        if (verificationId != null) {
          add(Register_RedirectToCheckOtp_Event(verificationId: verificationId,
              phone: event.phone,
              name: event.disPlayName,
              pass: event.password),);
        }
        print(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 120),
    );
    print('kết thúc');
  }

  FutureOr<void> register_ConfirmPart2_Event(Register_ComfirmPart2_Event event,
      Emitter<RegisterState> emit) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId, smsCode: event.sms);
    try {
      await _auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          _firestore.collection('chat_app')
              .doc(value.user!.uid)
              .set({
            'name': event.disPlayName,
            'phone': event.phone,
            'password': event.password,
          });
        }
      });
    } catch (e) {
      emit(Register_CheckOtpFailed_State());
    }
  }

  FutureOr<void> regiter_InvalidPhoneNumber_Event(
      Register_InvalidPhoneNumber_Event event, Emitter<RegisterState> emit) {
    emit(Register_InvalidPhoneNumber_State());
  }

  FutureOr<void> register_RedirectToCheckOtp_Event(
      Register_RedirectToCheckOtp_Event event, Emitter<RegisterState> emit) {
    emit(Register_CheckOTP_State(verificationId: event.verificationId,
        phone: event.phone,
        name: event.name,
        pass: event.pass));
  }
}
