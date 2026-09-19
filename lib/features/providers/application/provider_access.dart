import 'package:video_server_api/video_server_api.dart';

/// Display hint only; API admission remains authoritative.
ProviderStatusResponse? providerForInput(
  String input,
  Iterable<ProviderStatusResponse> providers,
) {
  final authority = RegExp(
    r'https?://[^\s/?#]+',
    caseSensitive: false,
  ).firstMatch(input)?.group(0);
  final host = authority == null
      ? null
      : Uri.tryParse(authority)?.host.toLowerCase();
  if (host == null || host.isEmpty) return null;
  for (final provider in providers) {
    if (provider.hosts.contains(host) ||
        provider.hostSuffixes.any(
          (suffix) => host == suffix || host.endsWith('.$suffix'),
        )) {
      return provider;
    }
  }
  return null;
}
