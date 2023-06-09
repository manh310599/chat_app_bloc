
import 'package:app_chat_bloc/Home/home_view.dart';
import 'package:app_chat_bloc/main.dart';
import 'package:app_chat_bloc/register/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../../collect_dialog.dart';
import '../../common.dart';


import '../bloc/register.event.dart';
import '../bloc/register_bloc.dart';


class RegisterHome extends StatefulWidget {
  const RegisterHome({Key? key}) : super(key: key);

  @override
  State<RegisterHome> createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  late RegisterBloc registerBloc;
  late RegisterState previousState;
  String mess = '';
  @override
  void initState() {
    registerBloc = RegisterBloc();
    super.initState();

  }


  bool showPass = true;
  bool showPass2 = true;

  final TextEditingController _email = TextEditingController();

  final TextEditingController _name = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  final TextEditingController _repass = TextEditingController();

  @override
  Widget build(BuildContext context) {


    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final spaceAppBar = AppBar().preferredSize.height;
    final theme = Theme.of(context).textTheme;

      return Scaffold(
        body:  BlocConsumer<RegisterBloc,RegisterState>(
          bloc: registerBloc,
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
                            Colors.blue.shade100,
                          ])),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: width * 0.75,
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2 * kPadding),
                        child: TextField(

                          controller: _email,

                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'Nhập vào Email',
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
                        padding: const EdgeInsets.symmetric(horizontal: 2 * kPadding),
                        child: TextField(
                          controller: _name,

                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: 'Nhập vào tên ',
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
                          controller: _pass,
                            obscureText: showPass,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPass == true
                                          ? showPass = false
                                          : showPass = true;
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kPadding * 2),
                        child: TextField(
                          controller: _repass,
                            obscureText: showPass2,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPass2 == true
                                          ? showPass2 = false
                                          : showPass2 = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Nhập lại mật khẩu',
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
                        onPressed: () async {


                          registerBloc.add(
                              RegisterConfirm_Event(
                                  email: _email.text,
                                  disPlayName: _name.text,
                                  password: _pass.text,
                                  comfirmPass: _repass.text),
                            );



                        },
                        elevation: 0,
                        color: Colors.yellow.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kBoradius)),
                        child: Padding(
                          padding: const EdgeInsets.all(kPadding),
                          child: Text(
                            'Đăng kí',
                            style: theme.titleMedium!.copyWith(
                                color: Colors.blue.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSpacing,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bạn đã có tài khoản?',
                            style:
                            theme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Đăng nhập ngay',
                                style: theme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold, color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              );
          },
          listener: (context, state) {
            if(state is Register_FieldlNull)
              {
                showDialogNotify('Bạn phải điền đầy đủ thông tin');
              }
            if (state is Register_InvaidEmail){
              showDialogNotify('Email của bạn không hợp lệ');
            }
            if (state is Register_ConfirmPass_Wrong)
              {
                showDialogNotify('Mật khẩu nhập lại không đúng');
              }
            if (state is Register_ConfirmPass_ToShort)
              {
                showDialogNotify('Mật khẩu phải có 6 kí tự trở lên');
              }
            if (state is Register_Email_Invaid)
              {
                showDialogNotify('Email này đã đươc đăng ký');
              }
            if (state is Resgister_Success)
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return MyApp();
                },));
              }
          },

        ),
      );
  }
}
