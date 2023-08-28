import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const Center(
      child: Text(
        "반갑습니다",
        style: TextStyle(
          fontSize: 30,
          color: Color.fromRGBO(121, 121, 255, 1),
        ),
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
