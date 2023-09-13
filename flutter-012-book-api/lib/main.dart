import 'package:book/api/naver_open_api.dart';
import 'package:book/models/naver_book_dto.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewBooksPage(),
    );
  }
}

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});

  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  // Future<List<NaverBookDto>>
  Future<List<NaverBookDto>>? resultBooks = NaverOpenAPI().loadBooks();

  void searchBooks(search) {
    Future<List<NaverBookDto>>? searchResultBooks =
        NaverOpenAPI().loadBooks(search);
    setState(() {
      resultBooks = searchResultBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        title: SearchBox(searchBooks: searchBooks),
      ),
      body: ViewListPage(resultBooks: resultBooks),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({super.key, required this.searchBooks});
  Function(String search) searchBooks;
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: TextField(
              controller: searchInputController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => searchBooks(value),
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                labelText: "검색어",
                hintText: "도서검색어를 입력하세요",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ViewListPage extends StatelessWidget {
  const ViewListPage({
    super.key,
    required this.resultBooks,
  });

  final Future<List<NaverBookDto>>? resultBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: resultBooks,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.data![index].image!),

                // child: Image.network(snapshot.data![index].image!),
              ),
              title: Text(snapshot.data![index].title!),
              subtitle: Text(snapshot.data![index].author!),
            ),
          );
        },
      ),
    );
  }
}
