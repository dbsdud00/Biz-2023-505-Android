import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: const Color.fromARGB(255, 90, 150, 107),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 홈페이지 입니다."),
            ElevatedButton(
                onPressed: () {
                  var user = User(
                    username: "callor",
                    password: "12341234",
                    email: "callor@callor.com",
                    nickname: "홍길동",
                    tel: "010-1111-1111",
                  );
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                            name: "홍길동",
                            email: "callor@callor.com",
                            userDto: user,
                          )));
                },
                child: const Text("자세히 보기"))
          ],
        ),
      ),
    );
  }
}
