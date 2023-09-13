import 'package:flutter/material.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/theme_controller.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.themeController});
  final ThemeController themeController;

  final textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();
    var timer = context.watch<TimerViewModel>().timerDto.timer;

    textEditController.text = timer.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            pageViewModel.bottomNavTap(0);
            FocusScope.of(context).unfocus();
          },

          color: Colors.white,
          // style: const ButtonStyle(iconColor: Colors.white),
          icon: const Icon(
            Icons.arrow_back_ios,
            // color: Colors.white,
          ),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("타이머 설정"),
            tiles: [
              SettingsTile(
                title: TextField(
                  decoration: const InputDecoration(labelText: "타이머 시작값"),
                  controller: textEditController,
                  onChanged: (value) {
                    context.read<TimerViewModel>().setTimer(int.parse(value));
                  },
                ),
                leading: const Icon(Icons.timer_outlined),
                description: const Text("타이머를 설정해 주세요"),
              ),
              SettingsTile(
                title: const TextField(
                  decoration: InputDecoration(labelText: "타이머 휴식값"),
                ),
                leading: const Icon(Icons.timer_off_outlined),
              ),
              SettingsTile(
                title: const Text("타이머"),
              ),
            ],
          ),
          SettingsSection(
            title: const Text("테마 설정"),
            tiles: [
              SettingsTile(
                  title: Row(
                children: [
                  const Text("테마 모드"),
                  const SizedBox(width: 20),
                  DropdownButton<ThemeMode>(
                    value: themeController.themeMode,
                    onChanged: (value) =>
                        themeController.updateThemeMode(value),
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text("시스템 테마"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text("다크 모드"),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text("라이트 모드"),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
          SettingsSection(
            title: const Text("공통 설정"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("타이머 즉시 실행"),
                initialValue: true,
                onToggle: (value) => false,
              ),
              SettingsTile(title: const Text("타이머")),
              SettingsTile(title: const Text("타이머")),
            ],
          ),
        ],
      ),
    );
  }
}

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var textController = TextEditingController();
//     var setTimer = context
//         .select<TimerViewModel, Function(int)>((value) => value.setTimer);

//     var pageViewModel = context.watch<PageViewModel>();

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(157, 255, 255, 255),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 decoration: const InputDecoration(hintText: "타이머입력"),
//                 controller: textController,
//               ),
//             ),
//             ElevatedButton(
//               // onPressed: () => context.select<TimerViewModel, Function(int)>(
//               //     (value) => value.setTimer(10)),
//               onPressed: () {
//                 setTimer(int.parse(textController.text));
//                 // 0번 page 로 되돌아 가기
//                 pageViewModel.bottomNavTap(0);
//                 // 키보드 감추기
//                 FocusManager.instance.primaryFocus?.unfocus();
//               },
//               child: const Text("저장"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
