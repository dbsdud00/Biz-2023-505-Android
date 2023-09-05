import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });
  final String name;
  final String email;
  final User userDto;
  @override
  State<StatefulWidget> createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자세히 보기"),
        backgroundColor: const Color.fromARGB(255, 90, 150, 107),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 디테일 페이지 입니다."),
            Text("이름 : ${widget.name}"),
            Text("이메일 : ${widget.email}"),
            Text("username : ${widget.userDto.username}"),
            Text("password : ${widget.userDto.password}"),
            Text("nickname : ${widget.userDto.nickname}"),
            Text("tel : ${widget.userDto.tel}"),
          ],
        ),
      ),
    );
  }
}
