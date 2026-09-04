import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisConfigurator extends StatefulWidget {
  const AnalysisConfigurator({
    required this.busy,
    required this.onStart,
    required this.skills,
    super.key,
  });

  final bool busy;
  final Future<void> Function({
    required String customPrompt,
    required String outputLanguage,
    required String skillId,
  })
  onStart;
  final List<AnalysisSkillResponse> skills;

  @override
  State<AnalysisConfigurator> createState() => _AnalysisConfiguratorState();
}

final class _AnalysisConfiguratorState extends State<AnalysisConfigurator> {
  final _promptController = TextEditingController();
  late String _language;
  String? _skillId;

  AnalysisSkillResponse? get _selected =>
      widget.skills.where((skill) => skill.id == _skillId).firstOrNull;

  @override
  void initState() {
    super.initState();
    _language = 'zh-CN';
    _selectInitialSkill();
  }

  @override
  void didUpdateWidget(covariant AnalysisConfigurator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_selected == null) _selectInitialSkill();
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _selectInitialSkill() {
    final first = widget.skills.firstOrNull;
    _skillId = first?.id;
    _promptController.text = first?.defaultPrompt ?? '';
  }

  void _selectSkill(String? id) {
    if (id == null) return;
    final previous = _selected;
    final next = widget.skills.where((skill) => skill.id == id).firstOrNull;
    if (next == null) return;
    final followsDefault =
        previous == null || _promptController.text == previous.defaultPrompt;
    setState(() => _skillId = id);
    if (followsDefault) _promptController.text = next.defaultPrompt;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selected = _selected;
    if (selected == null) {
      return Text(
        l10n.analysisSkillsEmpty,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }
    return Column(
      key: const Key('analysis-configurator'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppDropdownField<String>(
          key: const Key('analysis-skill-field'),
          value: selected.id,
          label: l10n.analysisSkillLabel,
          options: [
            for (final skill in widget.skills)
              AppDropdownOption(value: skill.id, label: skill.displayName),
          ],
          enabled: !widget.busy,
          onSelected: _selectSkill,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        Text(
          selected.description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.large),
        AppDropdownField<String>(
          key: const Key('analysis-language-field'),
          value: _language,
          label: l10n.analysisOutputLanguageLabel,
          options: [
            AppDropdownOption(
              value: 'zh-CN',
              label: l10n.simplifiedChineseLabel,
            ),
            AppDropdownOption(value: 'en-US', label: l10n.englishLabel),
          ],
          enabled: !widget.busy,
          onSelected: (value) {
            if (value != null) setState(() => _language = value);
          },
        ),
        const SizedBox(height: AppSpacing.large),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppSpacing.xSmall,
          spacing: AppSpacing.large,
          children: [
            Text(
              l10n.analysisPromptLabel,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            TextButton.icon(
              onPressed: widget.busy
                  ? null
                  : () => _promptController.text = selected.defaultPrompt,
              icon: const Icon(LucideIcons.rotateCcw, size: 16),
              label: Text(l10n.restoreDefaultPrompt),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xSmall),
        TextField(
          key: const Key('analysis-prompt-field'),
          controller: _promptController,
          enabled: !widget.busy,
          maxLength: 4000,
          maxLines: 6,
          minLines: 4,
          decoration: InputDecoration(
            helperMaxLines: 3,
            helperText: l10n.analysisPromptDescription,
          ),
        ),
        const SizedBox(height: AppSpacing.large),
        FilledButton.icon(
          key: const Key('start-analysis-button'),
          onPressed: widget.busy
              ? null
              : () => widget.onStart(
                  customPrompt: _promptController.text,
                  outputLanguage: _language,
                  skillId: selected.id,
                ),
          icon: widget.busy
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(LucideIcons.sparkles, size: 18),
          label: Text(
            widget.busy ? l10n.startingAnalysis : l10n.startAnalysisAction,
          ),
        ),
      ],
    );
  }
}
