import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_bloc.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_event.dart';
import 'package:mobile/business_logic/all_recipes_logic/all_recipes_state.dart';
import 'package:mobile/presentation/pages/search/recipes_display.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';
import 'package:mobile/presentation/widgets/progress_indicator/progress_indicator_xl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    getIt.get<AllRecipesBloc>().add(FetchAllRecipesEvent());
    logger.warning('SEARCH PAGE initstate', runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllRecipesBloc, AllRecipesState>(
      builder: (
        BuildContext context,
        AllRecipesState state,
      ) {
        final blocStatus = state.status;
        Widget content;
        if (blocStatus == BlocStatus.loading) {
          content = const Center(child: ProgressIndicatorXL());
        } else if (blocStatus == BlocStatus.error) {
          content = const Center(child: Text('Error'));
        } else {
          content = const RecipesDisplay();
        }

        return PageBase(pageBody: content);
      },
    );
  }
}
