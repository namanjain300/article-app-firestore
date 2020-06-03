import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article.dart';

class DatabaseService {
  // collection reference
  final CollectionReference articleCollection =
      Firestore.instance.collection('articles');

  Future updateUserData(
      String title, String description, String imageUrl) async {
    return await articleCollection.document().setData({
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    });
  }

  // article list from snapshot
  List<Article> _articleListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Article(
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? '',
        imageUrl: doc.data['imageUrl'] ?? '',
      );
    }).toList();
  }

  // get articles stream
  Stream<List<Article>> get articles {
    return articleCollection.snapshots().map(_articleListFromSnapshot);
  }
}
