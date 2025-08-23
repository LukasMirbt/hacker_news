import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCollectionPage extends StatelessWidget {
  const DataCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCollectionBloc(
        analyticsRepository: context.read<AnalyticsRepository>(),
      ),
      child: const DataCollectionView(),
    );
  }
}
