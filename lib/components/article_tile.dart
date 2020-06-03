import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  ArticleTile({this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.teal[400],
            backgroundImage: NetworkImage(article.imageUrl),
          ),
          title: Text(article.title),
          subtitle: Text(article.description),
        ),
      ),
    );
  }
}
