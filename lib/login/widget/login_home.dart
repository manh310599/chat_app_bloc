import 'package:app_chat_bloc/Home/home_view.dart';
import 'package:app_chat_bloc/collect_dialog.dart';
import 'package:app_chat_bloc/common.dart';
import 'package:app_chat_bloc/login/bloc/login_bloc.dart';
import 'package:app_chat_bloc/login/bloc/login_event.dart';
import 'package:app_chat_bloc/login/bloc/login_state.dart';
import 'package:app_chat_bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../register/widget/register_home.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final emalController = TextEditingController();
  final passController = TextEditingController();
  bool showPass = true;
  late LoginBloc loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    loginBloc = LoginBloc();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    // final spaceAppBar = AppBar().preferredSize.height;
    final theme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      body: BlocConsumer<LoginBloc, loginState>(
        bloc: loginBloc,
        builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.blue.shade900, // Màu xanh đậm
                  Colors.blue.shade100, // Màu xanh nhạt
                ],
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2 * kPadding),
                  child: TextField(
                      controller: emalController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Nhập vào số điện thoại',
                          filled: true,
                          fillColor: Colors.white,
                          counterText: '',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 1,
                              borderRadius:
                              BorderRadius.all(Radius.circular(kBoradius))))),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
                  child: TextField(
                      controller: passController,
                      obscureText: showPass,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass == true ? showPass = false : showPass =
                                true;
                              });
                            },
                            child: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                          ),
                          hintText: 'Nhập vào Mật khẩu',
                          filled: true,
                          fillColor: Colors.white,
                          counterText: '',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 1,
                              borderRadius:
                              BorderRadius.all(Radius.circular(kBoradius))))),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                MaterialButton(
                  onPressed: () {
                    loginBloc.add(LoginConfirmEvent(email: emalController.text, pass: passController.text));
                  },
                  elevation: 0,
                  color: Colors.yellow.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBoradius)),
                  child: Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Text(
                      'Đăng nhập',
                      style: theme.titleMedium!.copyWith(
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn chưa có tài khoản?',
                      style: theme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return const RegisterHome();
                          },));
                        },
                        child: Text(
                          'Đăng kí ngay',
                          style: theme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      }, listener: (context, state) {
        if (state is loginFaildState){
          showDialogNotify('Email hoặc mật khẩu không trùng khớp');
        }
        else if (state is emailIsNull)
          {
            showDialogNotify('Không được để trống các trường thông tin');
          }
        else if (state is loginSuccessFulState)
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return MyApp();
            },));
          }
      },),
    );
  }
}
