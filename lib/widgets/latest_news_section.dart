import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'latest_news_item.dart'; // Import the LatestNewsItem widget

class LatestNewsSection extends StatelessWidget {
  final List<News> latestNews;

  LatestNewsSection({required this.latestNews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest News',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 550, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.vertical, // Change to vertical scrolling
            reverse: true, // Reverse the scrolling direction
            itemCount: latestNews.length,
            itemBuilder: (BuildContext context, int index) {
              return LatestNewsItem(news: latestNews[index]);
            },
          ),
        ),
      ],
    );
  }
}
