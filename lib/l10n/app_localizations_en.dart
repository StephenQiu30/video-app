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
      'Open video inspection, download tasks, and appearance settings.';

  @override
  String get videoInspectionNavigation => 'Video inspection';

  @override
  String get downloadHistoryNavigation => 'Download history';

  @override
  String get providerStatusNavigation => 'Provider status';

  @override
  String get accountNavigation => 'Me';

  @override
  String get downloadHistoryDescription =>
      'Search, filter, and recover downloads for the current account, including progress, errors, and file availability.';

  @override
  String get downloadHistoryPendingTitle =>
      'Download history is not available yet';

  @override
  String get downloadHistoryPendingDescription =>
      'After native authentication and download query contracts are frozen, this tab will show the current account\'s real tasks and recovery state.';

  @override
  String get providerStatusDescription =>
      'View published capabilities, access modes, and verification status without exposing accounts, cookies, or probes.';

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
  String get downloadHomeTitle => 'Bring video\nback to your device.';

  @override
  String get downloadHomeDescription =>
      'Paste a public video link you are authorized to process, inspect its media details, choose a format, and create a trackable download task.';

  @override
  String get mediaUrlHint => 'Paste a public video link';

  @override
  String get mediaUrlLabel => 'Public video address';

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
  String get operationFailed =>
      'The operation did not complete. Try again later.';

  @override
  String get legalMediaStatus =>
      'Submit only public links you are authorized to process';

  @override
  String get privacyStatus =>
      'Do not submit links containing accounts or access credentials';
}
