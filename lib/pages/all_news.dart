import 'package:flutter/material.dart';

class ViewAllNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All News'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('News 1'),
            subtitle: Text('Details of News 1'),
          ),
          ListTile(
            title: Text('News 2'),
            subtitle: Text('Details of News 2'),
          ),
          ListTile(
            title: Text('News 3'),
            subtitle: Text('Details of News 3'),
          ),
          // Add more list items as needed
        ],
      ),
    );
  }
}
