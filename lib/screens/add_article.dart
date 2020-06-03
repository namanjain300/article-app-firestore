import 'package:flutter/material.dart';

import './articles.dart';
import '../services/database.dart';

class AddArticle extends StatefulWidget {
  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  String title;
  String description;
  String imageUrl;

  Future addArticle() async {
    await DatabaseService().updateUserData(title, description, imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Article',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.grey,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Articles(),
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue:
                          'https://homepages.inf.ed.ac.uk/rbf/HIPR2/images/stp1fur2.gif',
                      decoration: InputDecoration(
                        hintText: 'Image Url',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        imageUrl = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  addArticle();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Articles(),
                    ),
                  );
                },
                elevation: 1,
                child: Text('Add'),
                textColor: Colors.white,
                color: Colors.teal[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
