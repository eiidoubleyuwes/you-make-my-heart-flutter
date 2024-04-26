import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RaceWinnersPage extends StatefulWidget {
  @override
  _RaceWinnersPageState createState() => _RaceWinnersPageState();
}

class _RaceWinnersPageState extends State<RaceWinnersPage> {
  List<String> raceWinners = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // Fetch race winners data from the API
    final response = await http.get(Uri.parse("https://ergast.com/api/f1/current/last/results.json"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        raceWinners = List<String>.from(data);
      });
    } else {
      // Handle error
      print('Failed to load race winners');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Race Winners'),
      ),
      body: ListView.builder(
        itemCount: raceWinners.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(raceWinners[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}