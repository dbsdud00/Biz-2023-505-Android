import 'package:firebase/modules/validate.dart';
import 'package:firebase/pages/join_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modules/input_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.updateAuthUser});
  final Function(User? user) updateAuthUser;
  // State<> 클래스 위젯에 함수를 전달하기 위하여 선언하기
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,   // inputbox 키보드 화면 안올라가게 하기
      appBar: AppBar(
        title: const Text("로그인"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputFormField(
                focusNode: _emailFocus,
                validator: (value) => CheckValidate()
                    .emailCheck(email: value!, focusNode: _emailFocus),
                setValue: (value) => _emailValue = value,
                hintText: "이메일",
                helpText: " ",
              ),
              inputFormField(
                focusNode: _passwordFocus,
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate()
                    .passwordCheck(password: value!, focusNode: _emailFocus),
                helpText: " ",
                hintText: "비밀번호",
              ),

              /// 로그인 버튼
              loginButton(),

              /// 회원가입 버튼
              joinButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 11, 11, 139),
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailValue,
            password: _passwordValue,
          );
          debugPrint("------------------$result");
          widget.updateAuthUser(result.user);
          // setState(() {});
          if (!mounted) return;
          // result.user != null ? true : false
          // Navigator.pop(context, 데이터) : 현재 화면이 닫힐때
          // 현재 화면을 열었던 곳으로 `데이터` 를 return
          Navigator.pop(context, result.user != null);
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "로그인",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 11, 139, 88),
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  JoinPage(updateAuthUser: widget.updateAuthUser)));
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "회원가입",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
