/// Client-side decisions that do not parse or canonicalize public input.
///
/// The server is the only owner of URL extraction and URL policy. The app
/// keeps this small helper only for selecting the dedicated article workflow.
final _weChatArticleHost = RegExp(
  r'https?://mp\.weixin\.qq\.com(?:[/?#\s]|$)',
  caseSensitive: false,
);

bool hasPublicInput(String value) => value.trim().isNotEmpty;

bool containsWeChatArticleInput(String value) =>
    _weChatArticleHost.hasMatch(value);
