import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class BreakingNewsItem extends StatelessWidget {
  final News news;

  BreakingNewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle the onTap event here
        // You can add animation logic or navigate to another screen
        print('News item clicked: ${news.title}');
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 1, 18, 27),
              Color.fromARGB(255, 4, 21, 77),
              Color.fromARGB(255, 1, 18, 27),
            ],
          ),
        ),
        child: Stack(
          children: [
            if (news.imageUrl.isNotEmpty) // Add null-checking or validation logic
              Positioned.fill(
                child: Image.network(
                  news.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    background: Paint()..color = Colors.black.withOpacity(0.8), 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
