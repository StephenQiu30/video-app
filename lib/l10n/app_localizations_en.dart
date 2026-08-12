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
  String get foundationEyebrow => 'MOBILE CLIENT / TECHNICAL FOUNDATION';

  @override
  String get foundationTitle => 'Bring video\nback to your device.';

  @override
  String get foundationDescription =>
      'The Flutter project skeleton for iOS and Android is ready. This phase freezes technology and visual decisions only; business implementation has not started.';

  @override
  String get platformLabel => 'Target platforms';

  @override
  String get platformValue => 'Android API 24+ / iOS 13+';

  @override
  String get technologySelectionLabel => 'Selection scope';

  @override
  String get technologySelectionValue =>
      'Architecture, routing, state, networking, contracts, and secure storage';

  @override
  String get contractBoundaryLabel => 'Implementation status';

  @override
  String get contractBoundaryValue =>
      'Business screens, native sessions, and service APIs are not implemented';

  @override
  String get foundationFootnote =>
      'This screen only verifies the Flutter project, routing, localization, and visual tokens derived from the Web client. It does not claim any business capability is complete.';
}
