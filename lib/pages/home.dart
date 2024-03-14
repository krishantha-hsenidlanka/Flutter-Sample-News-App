import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/services/news_api_service.dart';
import 'package:news_app/widgets/category_slider.dart';
import 'package:news_app/widgets/breaking_news_slider.dart';
import 'package:news_app/data/category_data.dart';
import 'package:news_app/widgets/latest_news_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categories = categoryData;
  List<News> breakingNews = [];
  List<News> latestNews = [];
  final _newsApiService = NewsApiService();

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    try {
      breakingNews = await _newsApiService.fetchTopHeadlines();
      latestNews = breakingNews;
      print('Breaking News: $breakingNews');
      setState(() {});
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nire",
              style: TextStyle(fontSize: 30),
            ),
            Text("News",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySlider(
              categories: categories,
              onCategorySelected: (selectedCategory) {
                print('Category Clicked: $selectedCategory');
              },
            ),
            // SizedBox(height: 20),
            // BreakingNewsSlider(
            //   breakingNews: breakingNews,
            //   onViewAllClicked: () {
            //     print('View All Clicked');
            //     // Navigate to a separate page
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ViewAllNewsPage()),
            //     );
            //   },
            // ),
            SingleChildScrollView(
              child: LatestNewsSection(latestNews: latestNews),
            ),
          ],
        ),
      ),
    );
  }
}
