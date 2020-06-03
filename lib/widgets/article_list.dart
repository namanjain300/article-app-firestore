import 'package:firestore_task_blueaccent/components/article_tile.dart';
import 'package:firestore_task_blueaccent/models/article.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<List<Article>>(context);

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleTile(article: articles[index]);
      },
    );
  }
}
