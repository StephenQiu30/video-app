import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/providers/presentation/provider_access_selector.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final providerRuntimeProvider =
    FutureProvider.autoDispose<ProviderRuntimeListResponse>((ref) {
      ref.watch(authSessionProvider.select((session) => session.user?.id));
      return ref
          .watch(adminConfigurationRepositoryProvider)
          .fetchProviderRuntime();
    }, retry: (_, _) => null);

final class ProviderRuntimePanel extends ConsumerStatefulWidget {
  const ProviderRuntimePanel({super.key});
  @override
  ConsumerState<ProviderRuntimePanel> createState() =>
      _ProviderRuntimePanelState();
}

final class _ProviderRuntimePanelState
    extends ConsumerState<ProviderRuntimePanel> {
  bool _opened = false;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = _opened ? ref.watch(providerRuntimeProvider) : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ShadButton.ghost(
          onPressed: result?.isLoading == true
              ? null
              : () {
                  if (_opened) ref.invalidate(providerRuntimeProvider);
                  setState(() => _opened = true);
                },
          enabled:
              (result?.isLoading == true
                  ? null
                  : () {
                      if (_opened) ref.invalidate(providerRuntimeProvider);
                      setState(() => _opened = true);
                    }) !=
              null,
          height: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Flexible(child: Text(l10n.providerRuntimeTitle)),
        ),
        if (result != null) ...[
          Text(l10n.providerRuntimeDescription),
          ...result.when(
            loading: () => [const ShadProgress()],
            error: (_, _) => [Text(l10n.serviceUnavailableError)],
            data: (data) => [
              if (data.items.isEmpty) Text(l10n.providerEmptyDescription),
              for (final item in data.items)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${item.providerKey}${item.accessPolicyId == null ? '' : ' · ${accessPolicyLabel(l10n, item.accessPolicyId!)}'}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        item.routeConfigured
                            ? l10n.providerRouteConfigured
                            : l10n.providerConfigurationMissing,
                      ),
                      Text(
                        item.contextAvailable
                            ? l10n.providerContextObserved
                            : l10n.providerContextMissing,
                      ),
                      Text(
                        '${l10n.providerRuntimeEngine}: ${item.engineCommit ?? '—'}',
                      ),
                      if (item.evidenceState != ProviderEvidenceState.fresh)
                        Text(l10n.accessPolicyEvidenceMissing),
                      if (item.userAction != null) Text(item.userAction!),
                      if (item.routeRetryAt != null)
                        Text(
                          l10n.routeCooldownUntil(
                            formatDataTime(context, item.routeRetryAt),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ],
    );
  }
}
