import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mview/models/timer_dto.dart';

/// provider 를 활용한 ViewModel 패턴을 적용하기 위하여
/// ViewModel 클래스를 선언한다.
/// ChangeNotifier 라는 클래스를 상속받아서 작성한다.

/// state 변수는 State<> 클래스에서 선언하고
/// 값을 변화시키려면 setState() 함수를 통하여 실행했다.
/// provider 를 활용한 MVVM 패턴에서는 state 값을 변화시키는 코드를
/// ChangeNotifier를 상속받은 ViewModel 클래스에서 실행한다.
class TimerViewModel extends ChangeNotifier {
  /// viewModel 의 state 변수
  var timerDto = TimerDto();
  // 변수이름(식별자)에 _ 가 부착되면 이 변수는 private 성질을 띈다
  // async 패키지에 포함된 객체
  late Timer _timer;

  void setTimer(timer) {
    timerDto.timer = timer;
    notifyListeners();
  }

  void onPressed() {
    timerDto.timerRun = !timerDto.timerRun;
    debugPrint(timerDto.timerRun.toString());
    if (timerDto.timerRun) {
      /// Timer.periodic(시간값, 함수())
      /// 시간값이 경과할때마다 함수() 를 실행한다.
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          timerDto.timer--;
          // debugPrint("1초경과");
          if (timerDto.timer < 1) {
            timerDto.timer = 100;
            timerDto.timerRun = false;
            timer.cancel();
          }
          // viewModel 에서 state 변수 값을 변화시켰으니 화면에 그려라 라는 통보
          // State<> 클래스에서 setState() 함수를 실행시키는 것과 유사
          notifyListeners();
        },
      );
    } else {
      _timer.cancel();
    }
    notifyListeners();
  }
}
