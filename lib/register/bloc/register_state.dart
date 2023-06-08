import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable{}

abstract class Register_Error extends RegisterState {}

class Register_Initial_State extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Register_CheckOTP_State extends RegisterState {
  String verificationId;
  String phone;
  String name;
  String pass;

  Register_CheckOTP_State({
    required this.verificationId,
    required this.phone,
    required this.name,
    required this.pass,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [verificationId,phone,name,pass];
}

class Register_Success extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Register_PhoneExisted_State extends Register_Error {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Register_ConfirmPassDontSame_State extends Register_Error {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Register_InvalidPhoneNumber_State extends Register_Error {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Register_CheckOtpFailed_State extends Register_Error {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

