abstract class loginState {}

class loginSuccessFulState extends loginState {}

 class loginFaildState extends loginState {}

class emailIsNull extends loginFaildState {}

class passIsNull extends loginFaildState {}

class passToShort extends loginFaildState {}

class Unknow extends loginState {}
