import 'package:flutter/material.dart';
import 'package:news_api/models/articles.dart';

import 'package:news_api/models/top_news.dart';
import 'package:news_api/servies/fetch_servies.dart';
import 'package:news_api/theme/app_colors.dart';
import 'package:news_api/views/detail_view.dart';
import 'package:news_api/views/search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;

  Future<void> fetchNews() async {
    topNews = await TopNewsServies().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text(
          'News Aggregator',
          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (context, index) {
                final item = topNews!.articles[index];
                return NewsCard(item: item);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appBar,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchView(),
            ),
          );
        },
        child: const Icon(
          Icons.search,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.item,
  });

  final Articles item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView(news: item),
            ),
          );
        },
      ),
    );
  }
}
