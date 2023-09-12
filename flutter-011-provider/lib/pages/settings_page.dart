import 'package:flutter/material.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var setTimer = context
        .select<TimerViewModel, Function(int)>((value) => value.setTimer);

    var pageViewModel = context.watch<PageViewModel>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(157, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(hintText: "타이머입력"),
                controller: textController,
              ),
            ),
            ElevatedButton(
              // onPressed: () => context.select<TimerViewModel, Function(int)>(
              //     (value) => value.setTimer(10)),
              onPressed: () {
                setTimer(int.parse(textController.text));
                // 0번 page 로 되돌아 가기
                pageViewModel.bottomNavTap(0);
                // 키보드 감추기
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Text("저장"),
            )
          ],
        ),
      ),
    );
  }
}
