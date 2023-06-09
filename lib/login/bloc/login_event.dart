abstract class Login_Event {}

class LoginConfirmEvent extends Login_Event {
  String email;
  String pass;

  LoginConfirmEvent({required this.email,required this.pass});
}