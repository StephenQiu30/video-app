// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Framegrab';

  @override
  String get homeLinkLabel => 'Framegrab home';

  @override
  String get openNavigation => 'Open navigation menu';

  @override
  String get navigationDescription =>
      'Open content intake, download history, screenplay documents, provider status, and account settings.';

  @override
  String get homeNavigation => 'Home';

  @override
  String get downloadHistoryNavigation => 'Download history';

  @override
  String get screenplayDocumentsNavigation => 'Screenplays';

  @override
  String get providerStatusNavigation => 'Provider status';

  @override
  String get accountNavigation => 'Me';

  @override
  String get downloadHistoryDescription =>
      'Search, filter, and recover downloads, including progress, errors, completed video previews, file availability, and AI analysis.';

  @override
  String get downloadHistoryPendingTitle =>
      'Download history is not available yet';

  @override
  String get downloadHistoryPendingDescription =>
      'After native authentication, task query, and short-lived file authorization contracts are frozen, this tab will show real tasks, video previews, and analysis state.';

  @override
  String get screenplayDocumentsDescription =>
      'Review screenplay import state, extracted size, normalized previews, and analysis or rewrite results.';

  @override
  String get screenplayDocumentsPendingTitle =>
      'Screenplay documents are not available yet';

  @override
  String get screenplayDocumentsPendingDescription =>
      'After native upload, document query, and file authorization contracts are frozen, this tab will show real screenplay documents and results.';

  @override
  String get providerStatusDescription =>
      'View provider integration, access modes, latest checks, real download evidence, and complete analysis evidence without exposing accounts, cookies, egress, or probes.';

  @override
  String get providerStatusPendingTitle =>
      'Provider status is not available yet';

  @override
  String get providerStatusPendingDescription =>
      'After the native session contract is frozen, this tab will read real provider capabilities from the service without showing mock data.';

  @override
  String get accountDescription =>
      'Manage your profile, session, and app appearance.';

  @override
  String get appearanceSection => 'Appearance';

  @override
  String get accountSection => 'Account';

  @override
  String get darkThemeLabel => 'Dark appearance';

  @override
  String get themeToggleDescription => 'Switch between dark and light themes';

  @override
  String get nativeContractPendingShort =>
      'Sign-in, account details, and sign-out will open after the native session contract is frozen.';

  @override
  String get downloadHomeTitle => 'Bring content\nback to your device.';

  @override
  String get downloadHomeDescription =>
      'Inspect a public video link, or import a local video or screenplay you are authorized to process.';

  @override
  String get linkIntakeMode => 'Link';

  @override
  String get videoIntakeMode => 'Local video';

  @override
  String get screenplayIntakeMode => 'Screenplay';

  @override
  String get linkIntakeSupport =>
      'Supports public videos, single WeChat Channels posts, and WeChat Official Account articles. Multiple discovered videos require an explicit choice.';

  @override
  String get videoIntakeTitle => 'Import a local video';

  @override
  String get videoIntakeDescription =>
      'Choose a clear video file you own or are authorized to process. The service validates it in isolation before adding it to history and AI analysis.';

  @override
  String get selectVideoFile => 'Choose video file';

  @override
  String get screenplayIntakeTitle => 'Import a screenplay';

  @override
  String get screenplayIntakeDescription =>
      'Choose a TXT, DOCX, or PDF screenplay for normalized preview, analysis, and rewriting on the service.';

  @override
  String get selectScreenplayFile => 'Choose screenplay file';

  @override
  String get mediaUrlHint => 'Paste a public video or article link';

  @override
  String get mediaUrlLabel => 'Public content address';

  @override
  String get clearMediaUrl => 'Clear link';

  @override
  String get inspectMedia => 'Inspect media';

  @override
  String get inspectingMedia => 'Inspecting…';

  @override
  String get mediaUrlError => 'Enter a valid public HTTP(S) video address.';

  @override
  String get nativeContractPending =>
      'The presentation layer is ready. Native authentication and service contracts are not frozen, so real inspection requests remain unavailable.';

  @override
  String get nativeUploadContractPending =>
      'The page structure now matches the service. Native upload, session, and file authorization contracts are not frozen, so real files cannot be selected or submitted yet.';

  @override
  String get operationFailed =>
      'The operation did not complete. Try again later.';

  @override
  String get legalMediaStatus =>
      'Submit only public links you are authorized to process';

  @override
  String get privacyStatus =>
      'Do not submit links containing accounts or access credentials';
}
