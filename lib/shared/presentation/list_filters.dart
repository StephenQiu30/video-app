import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ListFilters extends StatefulWidget {
  const ListFilters({
    required this.query,
    required this.onSearch,
    required this.onStatus,
    required this.searchLabel,
    required this.statuses,
    super.key,
  });
  final ListQuery query;
  final ValueChanged<String> onSearch;
  final ValueChanged<String?> onStatus;
  final String searchLabel;
  final Map<String, String> statuses;
  @override
  State<ListFilters> createState() => _ListFiltersState();
}

final class _ListFiltersState extends State<ListFilters> {
  late final _search = TextEditingController(text: widget.query.search);
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      children: [
        ShadInput(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          controller: _search,
          textInputAction: TextInputAction.search,
          onSubmitted: (v) => widget.onSearch(v.trim()),
          placeholder: Text(widget.searchLabel),
          trailing: ShadTooltip(
            builder: (context) => Text(l.searchAction),
            child: Semantics(
              label: l.searchAction,
              child: ShadIconButton.ghost(
                icon: const Icon(PhosphorIconsRegular.magnifyingGlass),
                onPressed: () => widget.onSearch(_search.text.trim()),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        AppDropdownField<String>(
          value: widget.query.status ?? '',
          label: l.statusLabel,
          options: [
            AppDropdownOption(value: '', label: l.allStatuses),
            for (final entry in widget.statuses.entries)
              AppDropdownOption(value: entry.key, label: entry.value),
          ],
          onSelected: (value) => widget.onStatus(value == '' ? null : value),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
