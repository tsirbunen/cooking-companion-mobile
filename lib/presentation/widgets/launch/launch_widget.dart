import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/progress_indicator/progress_indicator_xl.dart';

const launchingText = 'Launching the , please wait...';

class LaunchWidget extends StatelessWidget {
  const LaunchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[Text(launchingText), ProgressIndicatorXL()],
          ),
        ),
      ),
    );
  }
}
