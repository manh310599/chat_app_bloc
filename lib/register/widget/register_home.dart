import 'package:app_chat_bloc/login/widget/login_home.dart';
import 'package:flutter/material.dart';

import '../../common.dart';

class RegisterHome extends StatefulWidget {
  const RegisterHome({Key? key}) : super(key: key);

  @override
  State<RegisterHome> createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height  = MediaQuery.of(context).size.height;
    // final spaceAppBar = AppBar().preferredSize.height;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.blue.shade900, // Màu xanh đậm
                Colors.blue.shade100,
              ])),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',height: width*0.75,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2 * kPadding),
                child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.phone,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2 * kPadding),
                child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
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
                    obscureText: showPass,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPass == true ? showPass = false : showPass = true;
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
                    obscureText: showPass,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPass == true ? showPass = false : showPass = true;
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
                onPressed: () {},
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
              SizedBox(height: kSpacing,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bạn chưa có tài khoản?',
                    style: theme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
      ),
    );
  }
}
