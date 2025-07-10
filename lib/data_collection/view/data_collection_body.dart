import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hacker_client/data_collection/data_collection.dart';

class DataCollectionBody extends StatelessWidget {
  const DataCollectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: Column(
        children: [
          AnalyticsSwitch(),
        ],
      ),
    );
  }
}
