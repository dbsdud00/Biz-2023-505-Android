# Flutter 에서 state 취급

- state 는 `statefulWidget` > `State` 클래스에서만 선언할 수 있다.
- `StatelessWidget` 에서 선언한 변수는 그냥 변수일 뿐이다.
- 생성된 state 는 자손 Widget(화면) 에 전달할 수 있다.
- 생성된 State 를 부모에게는 전달할 수 없다.
- 생성된 State는 형제들끼리는 공유, 전달 할 수 없다.
- 형제들끼리 공유를 하려면 부모 State 에서 생성하고, 형제들끼리 전달받아야 한다.
- 부모가 전달해준 State 변수는 자손이 직접 변경할 수 없다.
- 부모가 전달해준 State 변수를 자손이 변경하기 위해서는 부모가 State 를 변경하는 함수를 생성하여 전달해 주어야 한다.
-
