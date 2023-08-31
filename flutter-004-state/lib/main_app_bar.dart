import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text(
        "안녕하세요",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      backgroundColor: const Color.fromARGB(255, 208, 171, 171),
      centerTitle: true,
      elevation: 10.0,
      actions: [
        IconButton(
          onPressed: () {
            const snackBar = SnackBar(content: Text("안녕하세요"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.person),
        )
      ],
    );
