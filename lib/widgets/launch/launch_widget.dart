import 'package:flutter/material.dart';

const launchingText = 'Launching, please wait...';

class LaunchWidget extends StatelessWidget {
  const LaunchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text(launchingText),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
