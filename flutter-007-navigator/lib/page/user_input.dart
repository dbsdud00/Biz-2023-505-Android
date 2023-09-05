import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/page/my_page.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.userDto});
  final User userDto;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  var userNameInputController = TextEditingController();
  var passwordInputController = TextEditingController();
  var nicknameInputController = TextEditingController();
  var username = "";
  var password = "";
  var nickname = "";
  var tel = "";
  var email = "";
  bool passwordVisible = true;

  /// State 클래스가 생성될 때 호출되는 함수,
  /// State 변수나, State 클래스에서 사용하는 여러가지 변수들을 초기화 할 때
  /// 코드를 작성할 수 있는 부분
  @override
  void initState() {
    username = widget.userDto.username;
    password = widget.userDto.password;
    nickname = widget.userDto.nickname;
    email = widget.userDto.email;
    tel = widget.userDto.tel;
    userNameInputController.text = username;
    passwordInputController.text = password;
    nicknameInputController.text = nickname;
    super.initState();
  }

  /// State 에서 사용하던 Controller 를 메모리에서 제거하기
  /// 이 코드를 작성하지 않으면 메모리 leak(누수)가 발생한다.
  @override
  void dispose() {
    userNameInputController.dispose();
    passwordInputController.dispose();
    nicknameInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원정보 수정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: userNameInputController,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: username.length > 3
                      ? IconButton(
                          onPressed: () {
                            userNameInputController.clear();
                            setState(() {
                              username = "";
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const SizedBox(),
                  hintText: "Username",
                  labelText: "Username",
                ),
              ),
              TextField(
                controller: passwordInputController,
                obscureText: passwordVisible,
                obscuringCharacter: "★",
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: passwordVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    labelText: "password"),
              ),
              TextField(
                controller: nicknameInputController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.apple), labelText: "nickname"),
              ),
              ElevatedButton(
                  onPressed: () {
                    var userDto = User(
                      username: userNameInputController.text,
                      password: passwordInputController.text,
                      nickname: nicknameInputController.text,
                      email: "",
                      tel: "",
                    );
                    // Navigator.of(context).pop(userDto);
                    Navigator.pop(context, userDto);
                  },
                  child: const Text("정보수정"))
            ],
          ),
        ),
      ),
    );
  }
}
