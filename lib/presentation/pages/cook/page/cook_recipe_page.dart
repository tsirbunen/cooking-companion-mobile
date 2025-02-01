import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/router/routes.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/recipe_and_actions/cook_content.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/recipe_and_actions/cook_recipe_floating_action_buttons.dart';
import 'package:mobile/presentation/pages/cook/page_widgets/title_photo_and_tag_widgets/photos.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/models/side/side_enum.dart';
import 'package:mobile/presentation/widgets/page_base/page_base_customizable.dart';

const String directionKey = 'direction';

class CookRecipePage extends StatefulWidget {
  final int recipeId;

  const CookRecipePage({super.key, required this.recipeId});

  @override
  State<CookRecipePage> createState() => _CookRecipePageState();
}

class _CookRecipePageState extends State<CookRecipePage> {
  bool _shouldDetectSwipes = false;
  bool _animationsDone = false;
  late final ScrollController _scrollController;
  double _lastScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    final double position = _getPreviousScrollPosition();
    _scrollController = ScrollController(initialScrollOffset: position);
    _scrollController.addListener(setScrollPositionLocally);

    Future.delayed(const Duration(milliseconds: 1650), () {
      if (!mounted) return;
      setState(() {
        _animationsDone = true;
        _shouldDetectSwipes = true;
      });
    });
  }

  @override
  void dispose() {
    _storeScrollPositionForNextVisit();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBaseCustomizable(
      scrollController: _scrollController,
      hideAppBar: !_animationsDone,
      backgroundWidget: RecipePhotos(
        recipeId: widget.recipeId,
      ),
      pageBody: Container(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: _navigateToAnotherRecipeOnSwipe,
          child: Column(
            children: [CookContent(recipeId: widget.recipeId)],
          ),
        ),
      ),
      floatingWidget: _animationsDone
          ? CookRecipeFloatingActionButtons(recipeId: widget.recipeId)
          : null,
    );
  }

  double _getPreviousScrollPosition() {
    final int recipeId = widget.recipeId;
    return getIt.get<CookBloc>().getRecipeScrollPosition(recipeId);
  }

  void setScrollPositionLocally() {
    // Note: We do not want to setState because we do not want to rebuild the widget.
    // We only keep the last scroll position in memory so that once the user leaves the page,
    // we can send an event to store the scroll position data in the bloc.
    _lastScrollPosition = _scrollController.position.pixels;
  }

  void _storeScrollPositionForNextVisit() {
    getIt.get<CookBloc>().add(SetRecipeScrollPositionEvent(
        recipeId: widget.recipeId, position: _lastScrollPosition));
  }

  void _navigateToAnotherRecipeOnSwipe(DragUpdateDetails details) {
    if (!_shouldDetectSwipes) return;

    final Side side = _getSideFromSwipe(details);
    final int? recipeOnSideId = _getIdOfRecipeOnSide(side);
    if (recipeOnSideId == null) return;

    _navigateToRecipeWithPageSlideFromSide(recipeOnSideId, side);
    setState(() => _shouldDetectSwipes = false);
  }

  Side _getSideFromSwipe(DragUpdateDetails details) {
    return details.delta.dx < 0 ? Side.right : Side.left;
  }

  int? _getIdOfRecipeOnSide(Side side) {
    final cookBloc = getIt.get<CookBloc>();
    return cookBloc.getRecipeOnSideId(side, widget.recipeId);
  }

  void _navigateToRecipeWithPageSlideFromSide(int id, Side side) {
    context.go(
      _getCookRecipeWithIdRoute(id),
      extra: {directionKey: _getPageTransitionFromDirection(side)},
    );
  }

  String _getCookRecipeWithIdRoute(int id) {
    return '/$cookRecipePathRoot/$id';
  }

  AxisDirection _getPageTransitionFromDirection(Side side) {
    return side == Side.right ? AxisDirection.right : AxisDirection.left;
  }
}
