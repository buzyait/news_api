import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:news_api/constants/appi_const.dart';
import 'package:news_api/models/top_news.dart';

class TopNewsServies {
  final client = Client();

  Future<TopNews?> fetchTopNews() async {
    final url = Uri.parse(ApiConst.topNews);
    //final url2 = Uri(scheme: 'https',host: 'newsapi.org',
    // path: 'v2')
    final response = await client.get(url);

    log(response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);
      final data = jsonDecode(response.body);
      log(data.toString());
      log(data.runtimeType.toString());
      final topNews = TopNews.fromJson(data);
      log(topNews.toString());

      return topNews;
    }
    return null;
    // print ekoonun ayrmasy-4ygara beret
    //log bolso dekloygo
    //pley marketke bargan bolso pomit eelebeit.ishtebeit
  }

  Future<TopNews?> fetchSearchService(String title) async {
    final url = Uri.parse(ApiConst.searchNews(title));

    final response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final searchNews = TopNews.fromJson(data);
      return null;
    }
  }
}
