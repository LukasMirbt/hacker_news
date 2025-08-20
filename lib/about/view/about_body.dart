import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/about/about.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: Column(
        children: [
          LicenseListItem(),
          PrivacyPolicyListItem(),
          Divider(),
          VersionListItem(),
          Divider(),
        ],
      ),
    );
  }
}
