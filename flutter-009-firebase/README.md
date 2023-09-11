## firebase와 google 로그인 설정하기

- firebase console 에서 Authenticatio 에 google 공급업체 추가하기

## SHA 인증서 확인하기

- `jdk(jre) / bin` 폴더에서 `keytool.exe` 파일 찾기
- keytool 을 사용하여 SHA 인증서 확인하기
- bin 폴더에서 관리자 권한으로 cmd 창 열기

```cmd
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
# 비밀번호 : android

```

- 구글 로그인 도구 설치 : `flutter pub add google_sign_in`
