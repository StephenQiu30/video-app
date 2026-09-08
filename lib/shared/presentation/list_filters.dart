import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/list_query.dart';

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
        TextField(
          controller: _search,
          textInputAction: TextInputAction.search,
          onSubmitted: (v) => widget.onSearch(v.trim()),
          decoration: InputDecoration(
            labelText: widget.searchLabel,
            suffixIcon: IconButton(
              tooltip: l.searchAction,
              icon: const Icon(Icons.search),
              onPressed: () => widget.onSearch(_search.text.trim()),
            ),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          isExpanded: true,
          initialValue: widget.query.status ?? '',
          decoration: InputDecoration(labelText: l.statusLabel),
          items: [
            DropdownMenuItem(value: '', child: Text(l.allStatuses)),
            for (final entry in widget.statuses.entries)
              DropdownMenuItem(value: entry.key, child: Text(entry.value)),
          ],
          onChanged: (value) => widget.onStatus(value == '' ? null : value),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
