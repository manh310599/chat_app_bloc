import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterConfirm_Event extends RegisterEvent {

  String email;
  String password;
  String disPlayName;
  String comfirmPass;

  RegisterConfirm_Event(
      {required this.email, required this.password, required this.disPlayName, required this.comfirmPass});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, disPlayName, comfirmPass];

}



