class User {
  late final String username; // late :  조금 이따가 변경할거임
  late final String password;
  final String nickname;
  final String email;
  final String tel;

  User({
    required this.username,
    required this.password,
    required this.nickname,
    required this.email,
    required this.tel,
  });
}
