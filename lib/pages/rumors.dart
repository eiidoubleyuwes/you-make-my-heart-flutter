import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RumorsPage extends StatefulWidget {
  @override
  _RumorsPageState createState() => _RumorsPageState();
}

class _RumorsPageState extends State<RumorsPage> {
  List<String> predictions = [];

  Future<void> fetchPredictions() async {
    // Make an API call to fetch predictions from the remote database
    final response = await http.get(Uri.parse('http://barakambuguaon.top/news/predictions.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        predictions = List<String>.from(data['predictions']);
      });
    } else {
      // Handle error
      print('Failed to fetch predictions');
    }
  }

  Future<void> addPrediction(String prediction) async {
    // Make an API call to add the prediction to the remote database
    final response = await http.post(
      Uri.parse('https://api.example.com/predictions'),
      body: jsonEncode({'prediction': prediction}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      setState(() {
        predictions.add(prediction);
      });
    } else {
      // Handle error by displaying a snackbar or toast
      Get.snackbar('Error', 'Failed to add prediction');
    }
  }

  Future<void> deletePrediction(String prediction) async {
    // Make an API call to delete the prediction from the remote database
    final response = await http.delete(
      Uri.parse('https://api.example.com/predictions/$prediction'),
    );
    if (response.statusCode == 200) {
      setState(() {
        predictions.remove(prediction);
      });
    } else {
      // Handle error
      Get.snackbar('Error', 'Failed to delete prediction');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPredictions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rumors'),
      ),
      body: ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          return ListTile(
            title: Text(prediction),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deletePrediction(prediction),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String? prediction; // Declare the variable here
          prediction = await showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Prediction'),
              content: TextField(
                onChanged: (value) => prediction = value,
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () => Navigator.pop(context, prediction),
                ),
              ],
            ),
          );
          if (prediction != null) {
            addPrediction(prediction!);
          }
        },
      ),       
    );
  }
}