import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class AppBrand extends StatelessWidget {
  const AppBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Semantics(
      container: true,
      label: localizations.homeLinkLabel,
      child: ExcludeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/brand/logo.svg', height: 32, width: 32),
            const SizedBox(width: 12),
            Text(
              localizations.appTitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
