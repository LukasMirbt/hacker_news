import 'package:app/about/about.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AboutBloc(
        linkLauncher: context.read<LinkLauncher>(),
      ),
      child: const AboutView(),
    );
  }
}
