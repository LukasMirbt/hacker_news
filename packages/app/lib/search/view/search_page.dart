import 'package:app/search/search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
              ),
              child: SomethingSearchBar(),
            ),
            SizedBox(height: AppSpacing.md),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xlg,
              ),
              child: AppSectionHeader(title: 'Recent'),
            ),
            RecentSearchItem(search: 'Jerk'),
            RecentSearchItem(search: 'Sdkasdk'),
          ],
        ),
      ),
    );
  }
}
