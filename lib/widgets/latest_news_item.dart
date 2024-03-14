import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class LatestNewsItem extends StatelessWidget {
  final News news;

  LatestNewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(8.0),
      width: deviceWidth, // Set the width to the device width
      height: 250,
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
              child: Opacity(
                opacity: 0.8, 
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    news.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.8), // Set the background color of the text
                      child: Text(
                        news.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      color: Colors.black.withOpacity(0.8), // Set the background color of the text
                      child: Text(
                        // Assuming 'beginning text' refers to a short description or the beginning of the news article.
                        news.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
