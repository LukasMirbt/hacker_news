import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/data_collection/data_collection.dart';

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
