import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsApiService {
  final String _baseUrl = 'https://newsapi.org/v2';

  final String _apiKey = dotenv.env['API_KEY'].toString();

  Future<List<News>> fetchTopHeadlines() async {
    print(_apiKey);
    final response = await http
        .get(Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['articles'] as List;
      print('Top headlines loaded successfully');
      return data.map((article) => News.fromJson(article)).toList();
    } else {
      print(response.toString());
      print('Failed to load top headlines');
      throw Exception('Failed to load top headlines');
    }
  }
}
