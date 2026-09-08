import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class ListQuery {
  const ListQuery({this.page = 1, this.search = '', this.status});
  final int page;
  final String search;
  final String? status;
}

final class ListQueryController extends Notifier<ListQuery> {
  @override
  ListQuery build() => const ListQuery();
  void page(int value) => state = ListQuery(
    page: value,
    search: state.search,
    status: state.status,
  );
  void filter({String? search, String? status}) =>
      state = ListQuery(search: search ?? state.search, status: status);
}

final class ListPagination extends StatelessWidget {
  const ListPagination({
    required this.page,
    required this.total,
    required this.onPage,
    super.key,
  });
  final int page;
  final int total;
  final ValueChanged<int> onPage;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final pages = (total / 20).ceil().clamp(1, 1000000);
    if (pages == 1 && page == 1) return const SizedBox.shrink();
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      children: [
        TextButton(
          onPressed: page > 1 ? () => onPage(page - 1) : null,
          child: Text(l.previousPage),
        ),
        Text('$page / $pages'),
        TextButton(
          onPressed: page < pages ? () => onPage(page + 1) : null,
          child: Text(l.nextPage),
        ),
      ],
    );
  }
}
