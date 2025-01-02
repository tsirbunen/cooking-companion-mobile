import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';

const double padding = 25.0;

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final infoStyle = Theme.of(context).textTheme.bodyMedium;

    return PageBase(
      pageBody: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACCOUNT',
              style: infoStyle,
            ),
          ],
        ),
      ),
    );
  }
}
