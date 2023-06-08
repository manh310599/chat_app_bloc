import 'package:app_chat_bloc/common.dart';
import 'package:flutter/material.dart';

import '../../register/widget/register_home.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height  = MediaQuery.of(context).size.height;
    // final spaceAppBar = AppBar().preferredSize.height;
    final theme = Theme.of(context).textTheme;

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
            MaterialButton(
              onPressed: () {},
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
                  style: theme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
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
  }
}
