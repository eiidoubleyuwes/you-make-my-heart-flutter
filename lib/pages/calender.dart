import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: f1Races.length,
      itemBuilder: (context, index) {
        final race = f1Races[index];
        return ListTile(
          title: Text(race.name),
          subtitle: Text(race.date),
          trailing: Text(race.time),
        );
      },
    );
  }
}

class F1Race {
  final String name;
  final String date;
  final String time;

  F1Race({required this.name, required this.date, required this.time});
}

final List<F1Race> f1Races = [
  F1Race(
      name: 'Australian Grand Prix', date: '21 March 2024', time: '06:00 AM'),
  F1Race(name: 'Bahrain Grand Prix', date: '28 March 2024', time: '06:00 AM'),
  F1Race(name: 'Vietnam Grand Prix', date: '11 April 2024', time: '07:00 AM'),
  F1Race(name: 'Kenyan Grand Prix', date: '25 April 2024', time: '07:00 AM'),
  F1Race(name: 'South African Grand Prix', date: '11 May 2024', time: '09:00 AM'),
  F1Race(name: 'Las Vegas Grand Prix', date: '17 June 2024', time: '07:00 AM'),

  // Add more races here
];
