import 'package:framegrab/features/landing/domain/public_home_links.dart';
import 'package:framegrab/l10n/app_localizations.dart';

typedef PublicGuideSection = ({
  List<String> paragraphs,
  Uri source,
  String sourceLabel,
  String title,
});

List<PublicGuideSection> publicGuideSections(AppLocalizations l10n) => [
  (
    title: l10n.publicGuideVideoTitle,
    paragraphs: [
      l10n.publicGuideVideoParagraphOne,
      l10n.publicGuideVideoParagraphTwo,
      l10n.publicGuideVideoParagraphThree,
    ],
    source: PublicHomeLinks.repository,
    sourceLabel: l10n.publicGuideVideoSource,
  ),
  (
    title: l10n.publicGuideScreenplayTitle,
    paragraphs: [
      l10n.publicGuideScreenplayParagraphOne,
      l10n.publicGuideScreenplayParagraphTwo,
    ],
    source: PublicHomeLinks.repository,
    sourceLabel: l10n.publicGuideScreenplaySource,
  ),
  (
    title: l10n.publicGuideDeploymentTitle,
    paragraphs: [
      l10n.publicGuideDeploymentParagraphOne,
      l10n.publicGuideDeploymentParagraphTwo,
      l10n.publicGuideDeploymentParagraphThree,
    ],
    source: PublicHomeLinks.quickStart,
    sourceLabel: l10n.publicGuideDeploymentSource,
  ),
  (
    title: l10n.publicGuideClientsTitle,
    paragraphs: [
      l10n.publicGuideClientsParagraphOne,
      l10n.publicGuideClientsParagraphTwo,
    ],
    source: PublicHomeLinks.mobileRepository,
    sourceLabel: l10n.publicGuideClientsSource,
  ),
  (
    title: l10n.publicGuideAvailabilityTitle,
    paragraphs: [
      l10n.publicGuideAvailabilityParagraphOne,
      l10n.publicGuideAvailabilityParagraphTwo,
    ],
    source: PublicHomeLinks.repository,
    sourceLabel: l10n.publicGuideAvailabilitySource,
  ),
];
