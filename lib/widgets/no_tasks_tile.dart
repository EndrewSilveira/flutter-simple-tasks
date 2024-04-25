import 'package:flutter/material.dart';

import '../data/strings.dart';

class NoTasksTile extends StatelessWidget {
  const NoTasksTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ListTile(
        title: Text(
          Strings.theresNoTasksYet,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
