import 'package:app/data_collection/data_collection.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class DataCollectionBody extends StatelessWidget {
  const DataCollectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: AnalyticsSwitch(),
    );
  }
}
