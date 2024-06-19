import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/router/routes.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class CookPage extends StatelessWidget {
  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: Column(
        children: [
          Text('COOK'),
          ElevatedButton(
            onPressed: () {
              context.go('/$cookRecipePathRoot/1');
            },
            child: Text('NEXT'),
          )
        ],
      ),
    );
  }
}
