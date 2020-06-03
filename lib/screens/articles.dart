import '../widgets/article_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_article.dart';
import '../models/article.dart';
import '../services/database.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Article>>.value(
      value: DatabaseService().articles,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Articles',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'Add Article',
          backgroundColor: Colors.teal[400],
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddArticle(),
              ),
            );
          },
        ),
        body: ArticleList(),
      ),
    );
  }
}
