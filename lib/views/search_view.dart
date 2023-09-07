import 'package:flutter/material.dart';
import 'package:news_api/models/top_news.dart';
import 'package:news_api/servies/fetch_servies.dart';
import 'package:news_api/theme/app_colors.dart';

import 'home_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TopNews? topNews;
  bool isSearch = false;
  final controller = TextEditingController();

  Future<void> fetchData(String title) async {
    isSearch = true;
    setState(() {});
    topNews = await TopNewsServies().fetchSearchService(title);
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await fetchData(controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: AppColors.appBar,
        foregroundColor: AppColors.white,
        title: TextField(
          onSubmitted: (value) async {
            fetchData(value);
          },
          controller: controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 168, 168, 168),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isSearch) {
      return const Center(child: CircularProgressIndicator());
    } else if (isSearch == false && topNews != null) {
      return ListView.builder(
        itemCount: topNews!.articles.length,
        itemBuilder: (context, index) {
          final item = topNews!.articles[index];
          return NewsCard(item: item);
        },
      );
    } else {
      return const Center(
        child: Text('Маалымат изделе элек !!!'),
      );
    }
  }
}
