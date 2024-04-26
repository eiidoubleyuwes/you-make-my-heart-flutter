import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp_flutter/configs/constants.dart';
import 'package:myapp_flutter/views/newscards.dart';
import 'package:http/http.dart' as http;

class newsPage extends StatefulWidget {
  const newsPage({super.key});

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  late Future<List<NewsCard>> futureNewsCards;

  @override
  void initState() {
    super.initState();
    futureNewsCards = fetchNewsCards();
  }

  static Future<List<NewsCard>> fetchNewsCards() async {
    final response = await http
        .get(Uri.parse('http://barakambuguaon.top/news/racedetails.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> newsData = data['news'] ?? [];
      return newsData.map((item) => NewsCard.fromJson(item)).toList();
    } else {
      throw Exception(
          'Failed to load news cards: Status code ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        // F1 News Section
        Expanded(
          child: FutureBuilder<List<NewsCard>>(
            future: futureNewsCards,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final newsCards = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: newsCards.length,
                  itemBuilder: (context, index) {
                    return NewsCardWidget(newsCards[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              // Display a loading indicator while waiting for data
              return const Center(child: CircularProgressIndicator(color: ferrariyellow,));
            },
          ),
        ),
      ],
    );
  }
}
