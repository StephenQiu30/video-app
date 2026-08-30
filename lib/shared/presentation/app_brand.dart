import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class AppBrand extends StatelessWidget {
  const AppBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Text(
      localizations.appTitle,
      key: const Key('app-brand-wordmark'),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.45,
      ),
    );
  }
}
