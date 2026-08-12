import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class FoundationScreen extends StatelessWidget {
  const FoundationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations.appTitle,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 72),
                        Text(
                          localizations.foundationEyebrow,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: 20),
                        Semantics(
                          header: true,
                          child: Text(
                            localizations.foundationTitle,
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 0.98,
                                  letterSpacing: -2.4,
                                ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          localizations.foundationDescription,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                height: 1.7,
                              ),
                        ),
                        const SizedBox(height: 56),
                        _StatusRow(
                          icon: Icons.phone_iphone_rounded,
                          label: localizations.platformLabel,
                          value: localizations.platformValue,
                        ),
                        const Divider(),
                        _StatusRow(
                          icon: Icons.architecture_outlined,
                          label: localizations.technologySelectionLabel,
                          value: localizations.technologySelectionValue,
                        ),
                        const Divider(),
                        _StatusRow(
                          icon: Icons.description_outlined,
                          label: localizations.contractBoundaryLabel,
                          value: localizations.contractBoundaryValue,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          localizations.foundationFootnote,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                height: 1.6,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, semanticLabel: label),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
