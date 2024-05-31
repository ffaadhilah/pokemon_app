import 'package:flutter/material.dart';

class StatRowWidget extends StatelessWidget {
  final String stat;
  final int value;

  StatRowWidget({required this.stat, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            child: Text(
              stat,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 100.0,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                getColorByStat(stat),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColorByStat(String stat) {
    List<String> redStats = ['hp', 'defense', 'special-defense'];
    if (redStats.contains(stat.toLowerCase())) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
