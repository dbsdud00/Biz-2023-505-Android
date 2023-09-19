import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NaverBookDto {
  // String item; //	-	개별 검색 결과
  String? title; //String	책 제목
  String? link; //String	네이버 도서 정보 URL
  String? image; //String	섬네일 이미지의 URL
  String? author; //	String	저자 이름
  String? discount; //	Integer	판매 가격. 절판 등의 이유로 가격이 없으면 값을 반환하지 않습니다.
  String? publisher; //	String	출판사
  String? isbn; //	Integer	ISBN
  String? description; //	String	네이버 도서의 책 소개
  String? pubdate; //	dateTime	출간일
  NaverBookDto({
    this.title,
    this.link,
    this.image,
    this.author,
    this.discount,
    this.publisher,
    this.isbn,
    this.description,
    this.pubdate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'link': link,
      'image': image,
      'author': author,
      'discount': discount,
      'publisher': publisher,
      'isbn': isbn,
      'description': description,
      'pubdate': pubdate,
    };
  }

  factory NaverBookDto.fromMap(Map<String, dynamic> map) {
    return NaverBookDto(
      title: map['title'] != null ? map['title'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      discount: map['discount'] != null ? map['discount'] as String : null,
      publisher: map['publisher'] != null ? map['publisher'] as String : null,
      isbn: map['isbn'] != null ? map['isbn'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      pubdate: map['pubdate'] != null ? map['pubdate'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NaverBookDto.fromJson(String source) =>
      NaverBookDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
