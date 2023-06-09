import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable{}

abstract class Register_Error extends RegisterState {}

class Register_Initial_State extends RegisterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Unknow extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Register_FieldlNull extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Register_InvaidEmail extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class Register_ConfirmPass_Wrong extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class Register_ConfirmPass_ToShort extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Register_Email_Invaid extends Register_Error{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class Resgister_Success extends RegisterState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}