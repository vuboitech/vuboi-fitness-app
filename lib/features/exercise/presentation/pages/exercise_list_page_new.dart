import 'package:fitness/core/theme_cubit/theme_cubit.dart';
import 'package:fitness/features/exercise/presentation/widgets/exercise_grid_item.dart';
import 'package:fitness/theme/lib.dart';
import 'package:fitness/theme/src/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glass/glass.dart';
import 'package:go_router/go_router.dart';

class ExerciseListPageNew extends StatefulWidget {
  static const String routeName = '/new-exercise-list';

  const ExerciseListPageNew({
    super.key,
  });

  @override
  State<ExerciseListPageNew> createState() => _ExerciseListPageNewState();
}

class _ExerciseListPageNewState extends State<ExerciseListPageNew> {
  bool searchMode = false;
  bool gridMode = false;

  final TextEditingController _search = TextEditingController();
  var _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return PopScope(
          canPop: !searchMode,
          onPopInvokedWithResult: (didPop, dynamic) {
            if (searchMode) {
              setState(() {
                searchMode = false;
              });
            }
          },
          child: _exerciseListPage(),
        );
      },
    );
  }

  Widget _bottomSheet() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.appColor.bgTertiary.withOpacity(0.2),
          border: Border(
            top: BorderSide(
              color: context.theme.appColor.borderPrimary,
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '5 Selected',
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      variant: ButtonVariant.secondary,
                      onPressed: () {},
                      text: 'Back',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Select',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ).asGlass(
        tintColor: const Color(0xCCF9F9F9)
      ),
    );
  }

  Widget _exerciseListPage() {
    return Scaffold(
      backgroundColor: context.theme.appColor.bgTertiary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      !searchMode
                          ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.translate(
                                    offset: const Offset(-6, 0),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () => context.pop(),
                                          icon: const Icon(Icons.chevron_left),
                                        ),
                                        Text(
                                          'Exercise List',
                                          style: context
                                              .theme.appTextTheme.textLgBold
                                              .copyWith(
                                            color:
                                                context.theme.appColor.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(6, 0),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              searchMode = true;
                                              _searchFocus.requestFocus();
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            tapTargetSize:
                                                MaterialTapTargetSize.shrinkWrap,
                                            padding: EdgeInsets.zero,
                                            minimumSize: const Size(0, 0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 6,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Search',
                                                  style: context.theme.appTextTheme
                                                      .textMdRegular
                                                      .copyWith(
                                                    color: context.theme.appColor
                                                        .textPlaceholder,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Icon(
                                                  Icons.search,
                                                  color: context.theme.appColor
                                                      .textPlaceholder,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        visualDensity: VisualDensity.compact,
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: context.theme.appColor
                                              .textPlaceholder,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                          )
                          : Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Textfield(
                                      controller: _search,
                                      focusNode: _searchFocus,
                                    ),
                                  ),
                                  IconButton(
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () {
                                      setState(() {
                                        searchMode = false;
                                      });
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: FilterButton(
                                title: 'Filtered (6)',
                                iconSvgUri: 'assets/icons/ic_filter.svg',
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: FilterButton(
                                title: 'List View',
                                iconSvgUri:
                                    'assets/icons/ic_list_view_mode.svg',
                                onPressed: () {
                                  context.read<ThemeCubit>().toggleTheme();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          color: context.theme.appColor.borderPrimary,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          color: context.theme.appColor.bgSecondary,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    top: 20,
                                  ),
                                  child: Text(
                                    'Showing 46 Program',
                                    style: context
                                        .theme.appTextTheme.textSmSemibold
                                        .copyWith(
                                      color:
                                          context.theme.appColor.textSecondary,
                                    ),
                                  ),
                                ),
                                // build grid view
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                    right: 16,
                                    left: 16,
                                    top: 16,
                                    bottom: 120,
                                  ),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 9 / 11,
                                  ),
                                  itemCount: 16,
                                  itemBuilder: (context, index) {
                                    return ExerciseGridItem(
                                      key: Key('exercise_grid_item_$index'),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          _bottomSheet(),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final String iconSvgUri;
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.title,
    required this.iconSvgUri,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: context.theme.appColor.bgPrimary,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: context.theme.appColor.borderPrimary,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.theme.appTextTheme.textMdRegular.copyWith(
                color: context.theme.appColor.textSecondary,
              ),
            ),
            SvgPicture.asset(
              iconSvgUri,
              color: context.theme.appColor.fgQuinary,
              theme: SvgTheme(currentColor: context.theme.appColor.textPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
