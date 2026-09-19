import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:video_server_api/video_server_api.dart';

String accessPolicyLabel(AppLocalizations l10n, ProviderAccessPolicy policy) =>
    switch (policy) {
      ProviderAccessPolicy.public => l10n.accessPolicyPublic,
      ProviderAccessPolicy.operatorPublic => l10n.accessPolicyOperator,
      ProviderAccessPolicy.personalEntitled => l10n.accessPolicyPersonal,
      _ => l10n.accessPolicyUnavailable,
    };

final class ProviderAccessSelector extends StatelessWidget {
  const ProviderAccessSelector({
    required this.provider,
    required this.selected,
    required this.busy,
    required this.onChanged,
    super.key,
  });

  final ProviderStatusResponse provider;
  final ProviderAccessPolicy? selected;
  final bool busy;
  final ValueChanged<ProviderAccessPolicy> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (provider.accessPolicies.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        AppDropdownField<ProviderAccessPolicy?>(
          key: ValueKey('${provider.key}:${selected?.name}'),
          label: l10n.accessPolicyLabel,
          enabled: !busy,
          value: selected,
          onSelected: (value) {
            if (value != null) onChanged(value);
          },
          options: [
            for (final policy in provider.accessPolicies)
              AppDropdownOption(
                value: policy.id,
                enabled: policy.configured,
                label:
                    '${accessPolicyLabel(l10n, policy.id)}${policy.configured ? '' : ' (${l10n.accessPolicyUnavailable})'}',
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l10n.accessPolicyDescription,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (provider.evidenceState != ProviderEvidenceState.fresh)
          Text(
            l10n.accessPolicyEvidenceMissing,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        if (provider.routeRetryAt != null)
          Text(
            l10n.routeCooldownUntil(
              formatDataTime(context, provider.routeRetryAt),
            ),
          ),
      ],
    );
  }
}
