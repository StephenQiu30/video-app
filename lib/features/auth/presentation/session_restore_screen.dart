import 'package:flutter/material.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';

final class SessionRestoreScreen extends StatelessWidget {
  const SessionRestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBrand(),
              const Spacer(),
              Center(
                child: SizedBox.square(
                  key: const Key('session-restore-progress'),
                  dimension: 24,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSurface,
                    strokeWidth: 2,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
