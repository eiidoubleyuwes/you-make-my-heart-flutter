import 'package:flutter/material.dart';
class NewsCard {
  var title;
  var subtitle;
  var imageUrl;
  var description;

  NewsCard({
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.description,
  });
  factory NewsCard.fromJson(Map<String, dynamic> json) {
    return NewsCard(
      title: json['title'],
      subtitle: json['subtitle'],
      imageUrl: json['image_Url'],
      description: json['description'],
    );
  }
}


class NewsCardWidget extends StatelessWidget {
  final NewsCard news;

  NewsCardWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(news.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              news.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              news.subtitle,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
