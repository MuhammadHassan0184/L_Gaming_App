import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lgm/Config/app_colors.dart';
import 'package:lgm/Utils/mediaquery_extension.dart';

import '../Controller/country_controller.dart';

class CountryWidgets {
  CountryWidgets._();

  // ================================================================
  // ANIMATED COUNTRY APP BAR
  // ================================================================

  static Widget animatedAppBar(
    BuildContext context,
    CountryController controller,
  ) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CountryAppBarDelegate(
        context: context,
        controller: controller,
      ),
    );
  }

  static Widget categoryBar(
    BuildContext context,
    CountryController controller,
  ) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _CountryCategoryBarDelegate(
        context: context,
        controller: controller,
      ),
    );
  }

  static Widget _buildCategories(
    BuildContext context,
    CountryController controller,
  ) {
    return GetBuilder<CountryController>(
      id: 'country_categories',
      builder: (_) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: context.responsivePadding(horizontal: 0.035),
          itemCount: controller.categories.length,
          separatorBuilder: (_, _) {
            return SizedBox(width: context.widthPct(0.025));
          },
          itemBuilder: (context, index) {
            final String category = controller.categories[index];
            final bool selected = controller.selectedCategory == category;

            return _AnimatedCategory(
              title: category,
              selected: selected,
              onTap: () {
                controller.changeCategory(category);
              },
            );
          },
        );
      },
    );
  }

  // ================================================================
  // COUNTRY GRID
  // ================================================================

  static Widget countryGrid(
    BuildContext context,
    CountryController controller,
  ) {
    return GetBuilder<CountryController>(
      id: 'country_grid',
      builder: (_) {
        final countries = controller.filteredCountries;

        if (countries.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                'No countries found',
                style: TextStyle(
                  fontSize: context.scaledFont(14),
                  color: AppColors.countryMutedText,
                ),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: context.responsivePadding(
            horizontal: 0.030,
            vertical: 0.012,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              final country = countries[index];

              return countryCard(context, controller, country);
            }, childCount: countries.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: context.widthPct(0.025),
              mainAxisSpacing: context.heightPct(0.012),
              childAspectRatio: 2.75,
            ),
          ),
        );
      },
    );
  }

  // ================================================================
  // COUNTRY CARD
  // ================================================================

  static Widget countryCard(
    BuildContext context,
    CountryController controller,
    dynamic country,
  ) {
    final bool isSelected = controller.isSelected(country);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.selectCountry(country);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: context.responsivePadding(horizontal: 0.025),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.countrySelected : AppColors.countryCard,
          borderRadius: BorderRadius.circular(context.widthPct(0.018)),
          border: Border.all(
            color: isSelected
                ? AppColors.countrySelectedBorder
                : Colors.transparent,
            width: context.widthPct(0.002),
          ),
        ),
        child: Row(
          children: [
            Text(
              country.flag,
              style: TextStyle(fontSize: context.scaledFont(20)),
            ),

            SizedBox(width: context.widthPct(0.018)),

            Expanded(
              child: Text(
                country.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: context.scaledFont(11.5),
                  color: AppColors.countryText,
                ),
              ),
            ),

            AnimatedScale(
              scale: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutBack,
              child: Container(
                width: context.widthPct(0.045),
                height: context.widthPct(0.045),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.countryCheck,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: context.scaledFont(13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================================================================
// COUNTRY APP BAR DELEGATE
// ==================================================================

class _CountryAppBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final CountryController controller;

  _CountryAppBarDelegate({required this.context, required this.controller});

  // ================================================================
  // RESPONSIVE HEIGHTS
  // ================================================================

  double get _topHeight => context.heightPct(0.082);

  // ================================================================
  // MAX EXTENT
  // ================================================================

  @override
  double get maxExtent => _topHeight;

  // ================================================================
  // MIN EXTENT
  // ================================================================

  @override
  double get minExtent => _topHeight;

  // ================================================================
  // BUILD
  // ================================================================

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double range = maxExtent - minExtent;

    final double progress = range <= 0
        ? 0.0
        : (shrinkOffset / range).clamp(0.0, 1.0);

    final double reverseProgress = 1.0 - progress;

    return GetBuilder<CountryController>(
      id: 'country_header',
      builder: (_) {
        return ClipRect(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.countryHeaderGradient,
            ),
            child: Stack(
              children: [
                // ==================================================
                // TOP HEADER
                // ==================================================
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: _topHeight,
                  child: _buildTopHeader(context, reverseProgress),
                ),

                // ==================================================
                // SUBTLE BOTTOM SHADOW
                // ==================================================
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: context.heightPct(0.004),
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 120),
                      opacity: overlapsContent ? 1.0 : 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.06),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ================================================================
  // TOP HEADER
  // ================================================================

  Widget _buildTopHeader(BuildContext context, double visibleProgress) {
    return Opacity(
      opacity: visibleProgress,
      child: Transform.translate(
        offset: Offset(0, -context.heightPct(0.020) * (1.0 - visibleProgress)),
        child: Padding(
          padding: context.responsivePadding(horizontal: 0.035),
          child: Row(
            children: [
              // ==================================================
              // PROFILE
              // ==================================================
              AnimatedScale(
                scale: 0.90 + (0.10 * visibleProgress),
                duration: const Duration(milliseconds: 100),
                child: Container(
                  width: context.widthPct(0.085),
                  height: context.widthPct(0.085),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: context.widthPct(0.005),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: context.widthPct(0.025),
                        offset: Offset(0, context.heightPct(0.004)),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.countryText,
                    size: context.scaledFont(21),
                  ),
                ),
              ),

              SizedBox(width: context.widthPct(0.020)),

              // ==================================================
              // TOP TABS
              // ==================================================
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.topTabs.map((tab) {
                    final bool selected = controller.selectedTopTab == tab;

                    return _AnimatedTopTab(
                      title: tab,
                      selected: selected,
                      onTap: () {
                        controller.changeTopTab(tab);
                      },
                      visibleProgress: visibleProgress,
                    );
                  }).toList(),
                ),
              ),

              SizedBox(width: context.widthPct(0.018)),

              // ==================================================
              // SEARCH
              // ==================================================
              _AnimatedSearchButton(
                visibleProgress: visibleProgress,
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CountrySearchDelegate(controller),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================================================
  // SHOULD REBUILD
  // ================================================================

  @override
  bool shouldRebuild(covariant _CountryAppBarDelegate oldDelegate) {
    return oldDelegate.controller != controller;
  }
}

class _CountryCategoryBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final CountryController controller;

  _CountryCategoryBarDelegate({
    required this.context,
    required this.controller,
  });

  double get _height => context.heightPct(0.050);

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.countryHeaderGradient,
      ),
      child: CountryWidgets._buildCategories(context, controller),
    );
  }

  @override
  bool shouldRebuild(covariant _CountryCategoryBarDelegate oldDelegate) {
    return oldDelegate.controller != controller;
  }
}

// ==================================================================
// TOP TAB
// ==================================================================

class _AnimatedTopTab extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;
  final double visibleProgress;

  const _AnimatedTopTab({
    required this.title,
    required this.selected,
    required this.onTap,
    required this.visibleProgress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        padding: context.responsivePadding(horizontal: 0.008, vertical: 0.008),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              style: TextStyle(
                fontSize: context.scaledFont(11.5),
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                color: selected
                    ? AppColors.countryText
                    : AppColors.countryMutedText,
              ),
              child: Text(title),
            ),

            SizedBox(height: context.heightPct(0.004)),

            // ======================================================
            // ANIMATED UNDERLINE
            // ======================================================
            AnimatedContainer(
              duration: const Duration(milliseconds: 280),
              curve: Curves.easeOutBack,
              width: selected ? context.widthPct(0.045) : 0,
              height: context.heightPct(0.0015),
              decoration: BoxDecoration(
                color: AppColors.countryText,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================================================================
// SEARCH BUTTON
// ==================================================================

class _AnimatedSearchButton extends StatefulWidget {
  final double visibleProgress;
  final VoidCallback onTap;

  const _AnimatedSearchButton({
    required this.visibleProgress,
    required this.onTap,
  });

  @override
  State<_AnimatedSearchButton> createState() => _AnimatedSearchButtonState();
}

class _AnimatedSearchButtonState extends State<_AnimatedSearchButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          pressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          pressed = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          pressed = false;
        });

        widget.onTap();
      },
      child: AnimatedScale(
        scale: pressed ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: context.widthPct(0.090),
          height: context.widthPct(0.090),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.96),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: context.widthPct(0.020),
                offset: Offset(0, context.heightPct(0.003)),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.search_rounded,
            color: AppColors.countryText,
            size: context.scaledFont(20),
          ),
        ),
      ),
    );
  }
}

// ==================================================================
// CATEGORY
// ==================================================================

class _AnimatedCategory extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _AnimatedCategory({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        alignment: Alignment.center,
        padding: context.responsivePadding(horizontal: 0.008),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? AppColors.countryActive : Colors.transparent,
              width: context.heightPct(0.0015),
            ),
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          style: TextStyle(
            fontSize: context.scaledFont(11),
            fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
            color: selected
                ? AppColors.countryText
                : AppColors.countryMutedText,
          ),
          child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}

// ==================================================================
// SEARCH DELEGATE
// ==================================================================

class CountrySearchDelegate extends SearchDelegate<String?> {
  final CountryController controller;

  CountrySearchDelegate(this.controller);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.countryBackground,
        foregroundColor: AppColors.countryText,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) {
      return null;
    }

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResults(context);
  }

  Widget _buildResults(BuildContext context) {
    final searchText = query.trim().toLowerCase();

    final results = controller.countries.where((country) {
      if (searchText.isEmpty) {
        return true;
      }

      return country.name.toLowerCase().contains(searchText);
    }).toList();

    if (results.isEmpty) {
      return Container(
        color: AppColors.countryBackground,
        alignment: Alignment.center,
        child: Text(
          'No countries found',
          style: TextStyle(
            fontSize: context.scaledFont(14),
            color: AppColors.countryMutedText,
          ),
        ),
      );
    }

    return Container(
      color: AppColors.countryBackground,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: context.responsivePadding(horizontal: 0.030, vertical: 0.015),
        itemCount: results.length,
        separatorBuilder: (_, __) {
          return SizedBox(height: context.heightPct(0.010));
        },
        itemBuilder: (context, index) {
          final country = results[index];

          final selected = controller.isSelected(country);

          return GestureDetector(
            onTap: () {
              controller.selectCountry(country);

              close(context, country.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: context.heightPct(0.065),
              padding: context.responsivePadding(horizontal: 0.035),
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.countrySelected
                    : AppColors.countryCard,
                borderRadius: BorderRadius.circular(context.widthPct(0.020)),
              ),
              child: Row(
                children: [
                  Text(
                    country.flag,
                    style: TextStyle(fontSize: context.scaledFont(21)),
                  ),

                  SizedBox(width: context.widthPct(0.025)),

                  Expanded(
                    child: Text(
                      country.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.scaledFont(13),
                        color: AppColors.countryText,
                      ),
                    ),
                  ),

                  if (selected)
                    Container(
                      width: context.widthPct(0.045),
                      height: context.widthPct(0.045),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.countryCheck,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: context.scaledFont(13),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
