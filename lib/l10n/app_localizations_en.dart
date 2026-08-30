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
  String get openNavigation => 'Open navigation menu';

  @override
  String get navigationDescription =>
      'Open content intake, download history, screenplay documents, provider status, and account settings.';

  @override
  String get homeNavigation => 'Home';

  @override
  String get downloadHistoryNavigation => 'Download history';

  @override
  String get historyTab => 'History';

  @override
  String get screenplayDocumentsNavigation => 'Screenplays';

  @override
  String get documentsTab => 'Documents';

  @override
  String get providerStatusNavigation => 'Provider status';

  @override
  String get statusTab => 'Status';

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
      'After task query and short-lived file authorization contracts are frozen, this tab will show real tasks, video previews, and analysis state.';

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
      'After the provider capability contract is frozen, this tab will read real status from the service without showing mock data.';

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
  String get loginAction => 'Sign in';

  @override
  String get registerAction => 'Register';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get loginDescription =>
      'Use your Framegrab account to continue managing downloads, documents, and analysis.';

  @override
  String get createAccountTitle => 'Create your Framegrab account';

  @override
  String get registerDescription =>
      'Register to restore sessions across devices and securely access your tasks.';

  @override
  String get emailLabel => 'Email';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginSubmitting => 'Signing in…';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerSubmitting => 'Creating…';

  @override
  String get goRegister => 'Create account';

  @override
  String get goLogin => 'Back to sign in';

  @override
  String get noAccountPrompt => 'New to Framegrab?';

  @override
  String get hasAccountPrompt => 'Already have an account?';

  @override
  String get invalidEmail => 'Enter a valid email address.';

  @override
  String get invalidUsername => 'Username must contain 2–32 characters.';

  @override
  String get invalidPassword => 'Password must contain at least 8 characters.';

  @override
  String get passwordMismatch => 'The passwords do not match.';

  @override
  String get invalidCredentialsError => 'The email or password is incorrect.';

  @override
  String get emailRegisteredError =>
      'That email is already registered. Sign in instead.';

  @override
  String get usernameRegisteredError => 'That username is already in use.';

  @override
  String get unauthenticatedError => 'Your session expired. Sign in again.';

  @override
  String get rateLimitedError => 'Too many attempts. Try again later.';

  @override
  String get serviceUnavailableError =>
      'The service is unavailable. Check your connection and retry.';

  @override
  String get unknownAuthError =>
      'The operation did not complete. Try again later.';

  @override
  String get sessionRestoring => 'Restoring your session…';

  @override
  String get signedOutTitle => 'Sign in to continue';

  @override
  String get signedOutDescription =>
      'Sign in or register to view your profile and access tasks tied to your account.';

  @override
  String get signedInAs => 'Current account';

  @override
  String get logoutAction => 'Sign out';

  @override
  String get loggingOut => 'Signing out…';

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
      'The presentation layer and native sign-in are ready. The media inspection and download contract is not frozen, so real requests remain unavailable.';

  @override
  String get nativeUploadContractPending =>
      'The page structure and native sign-in are ready. Upload and file authorization contracts are not frozen, so real files cannot be submitted yet.';

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
