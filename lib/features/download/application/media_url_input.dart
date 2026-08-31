final _httpUrlPattern = RegExp(r'https?://[^\s]+', caseSensitive: false);
final _trailingCharacters = RegExp(r'''[.,!?;:，。！？；：、)）】》〉」』〕］｝\]}>'"”’]+$''');

/// Returns the only HTTP(S) URL in a direct URL or platform share message.
///
/// Platform share actions commonly copy a title, hashtags, timestamp, and
/// instructions around the actual short URL. Keep the extraction here so the
/// API receives the same normalized value as the Web client.
String? normalizeMediaUrl(String value) {
  final input = value.trim();
  if (input.isEmpty) return null;

  final matches = _httpUrlPattern.allMatches(input).toList(growable: false);
  if (matches.length > 1) return null;

  final rawCandidate = matches.singleOrNull?.group(0) ?? input;
  final candidate = rawCandidate.replaceFirst(_trailingCharacters, '');
  final uri = Uri.tryParse(candidate);
  if (uri == null ||
      !uri.hasAuthority ||
      uri.host.isEmpty ||
      !const {'http', 'https'}.contains(uri.scheme.toLowerCase()) ||
      uri.userInfo.isNotEmpty) {
    return null;
  }

  return candidate;
}
