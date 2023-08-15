import 'package:flutter/material.dart';
import 'package:news_api/constants/appi_const.dart';
import 'package:news_api/models/top_news.dart';
import 'package:news_api/servies/fetch_servies.dart';
import 'package:news_api/theme/app_colors.dart';
import 'package:news_api/views/detali_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
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
    TopNewsServies().fetchTopNews();
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
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              //bul widget card tizip beret
              itemCount: topNews!.articles.length,
              itemBuilder: (context, index) {
                final item = topNews!.articles[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetaliView(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.network(
                              item.urlToImage ?? ApiConst.image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              item.title,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
