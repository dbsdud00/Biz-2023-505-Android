import 'dart:convert';

import 'package:book/models/naver_book_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: constant_identifier_names

const CLIENT_ID = "ZhDj52aRVng9YcfGXASG";
const CLIENT_SECRET = "UfCwODosjs";
const NAVER_BOOK_URL = "https://openapi.naver.com/v1/search/book.json";

class NaverOpenAPI {
  /// Naver 개발자 센터에 애플리케이션을 등록하고
  /// Client_ID 와 Client_Secret 을 확인하고
  /// 아래 항목에 설정한 후
  /// api/naver_open_api.dart 로 이름을 변경한 후
  ///
  Future<List<NaverBookDto>> loadBooks([search]) async {
    Map<String, String> headers = {
      "X-Naver-Client-Id": "YOUR NAVER CLIENT ID",
      "X-Naver-Client-Secret": "YOUR NAVER CLIENT SECRET",
    };
    String query = search ??= "자바";

    /// ?변수1=값1&변수2=값2&변수3=값3
    String queryString = Uri(queryParameters: {
      "query": query,
      "display": "20",
      "start": "1",
    }).query; //?query=$query";
    dynamic response;
    try {
      response = await http.get(
        headers: headers,
        Uri.parse("$NAVER_BOOK_URL?$queryString"),
      );
    } catch (e) {
      debugPrint("http 요청오류 $queryString");
    }
    if (response?.statusCode == 200) {
      debugPrint("응답");
      // debugPrint("응답받은 데이터 ${response.body.toString()}");
      Iterable resultItems = await json.decode(response.body)["items"];
      var bookList = resultItems.map((dto) {
        var result = NaverBookDto.fromJson(dto);
        return result;
      });
      return bookList.toList();
    } else {
      debugPrint("응답 오류 발생 : ${response.body.toString()}");
      throw Exception("API 연결 문제 발생");
    }
  }
}
