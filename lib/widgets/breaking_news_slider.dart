import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/news_item.dart';

class BreakingNewsSlider extends StatelessWidget {
  final List<News> breakingNews;
  final Function() onViewAllClicked;

  BreakingNewsSlider({required this.breakingNews, required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Breaking News',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: breakingNews.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 400, // Set the desired width for each item
                child: BreakingNewsItem(news: breakingNews[index]),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onViewAllClicked,
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
