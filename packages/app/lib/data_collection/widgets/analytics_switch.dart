import 'package:app/data_collection/data_collection.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsSwitch extends StatelessWidget {
  const AnalyticsSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final isAnalyticsCollectionEnabled = context.select(
      (DataCollectionBloc bloc) => bloc.state.isAnalyticsCollectionEnabled,
    );

    final l10n = AppLocalizations.of(context);

    return SwitchListTile(
      value: isAnalyticsCollectionEnabled,
      title: Text(l10n.dataCollection_analytics),
      onChanged: (_) {
        context.read<DataCollectionBloc>().add(
          const DataCollectionAnalyticsToggled(),
        );
      },
    );
  }
}
