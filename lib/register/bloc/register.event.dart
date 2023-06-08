import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterConfirm_Event extends RegisterEvent {

  String phone;
  String password;
  String disPlayName;
  String comfirmPass;

  RegisterConfirm_Event(
      {required this.phone, required this.password, required this.disPlayName, required this.comfirmPass});

  @override
  // TODO: implement props
  List<Object?> get props => [phone, password, disPlayName, comfirmPass];

}

class Register_ComfirmPart2_Event extends RegisterEvent {
  String verificationId;
  String phone;
  String disPlayName;
  String password;
  String sms;

  Register_ComfirmPart2_Event(
      {
        required this.verificationId,
        required this.phone,
        required this.disPlayName,
        required this.password,
        required this.sms,
      });

  @override
  // TODO: implement props
  List<Object?> get props => [verificationId,phone,disPlayName,password,sms];
}

class Register_RedirectToCheckOtp_Event extends RegisterEvent {
  String verificationId;
  String phone;
  String name;
  String pass;
  Register_RedirectToCheckOtp_Event({
    required this.verificationId,
    required this.phone,
    required this.name,
    required this.pass,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [verificationId,phone,name,pass];
}

class Register_InvalidPhoneNumber_Event extends RegisterEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}