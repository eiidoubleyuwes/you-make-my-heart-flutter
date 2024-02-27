import 'package:flutter/material.dart';
import 'package:myapp_flutter/pages/calender.dart';

class TrackDetailsPage extends StatelessWidget {
  final F1Race race;

  const TrackDetailsPage({Key? key, required this.race}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(race.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display track image (implementation needed)
              Text(
                "Track Information",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10.0),

              // Display track details (circuit length, layout image, history, etc.)
            ],
          ),
        ),
      ),
    );
  }
}
