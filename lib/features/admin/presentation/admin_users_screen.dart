import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_dropdown_field.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminUsersScreen extends ConsumerWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentUserId = ref.watch(authSessionProvider).user?.id;
    final result = ref.watch(adminUsersProvider);
    return AdminPage(
      title: l10n.adminUsersTitle,
      description: l10n.adminUsersDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () => ref.refresh(adminUsersProvider.future).then((_) {}),
      children: [
        DropdownButtonFormField<String>(
          isExpanded: true,
          initialValue: ref.watch(userRoleFilterProvider)?.name ?? '',
          decoration: InputDecoration(labelText: l10n.adminRoleLabel),
          items: [
            DropdownMenuItem(value: '', child: Text(l10n.allRoles)),
            DropdownMenuItem(value: 'user', child: Text(l10n.adminRoleUser)),
            DropdownMenuItem(value: 'admin', child: Text(l10n.adminRoleAdmin)),
          ],
          onChanged: (v) => ref
              .read(userRoleFilterProvider.notifier)
              .select(v == null || v.isEmpty ? null : UserRole.valueOf(v)),
        ),
        ListFilters(
          query: ref.watch(userListQueryProvider),
          searchLabel: l10n.searchUsers,
          statuses: {
            'active': l10n.adminAccountEnabled,
            'inactive': l10n.adminAccountDisabled,
          },
          onSearch: (v) => ref
              .read(userListQueryProvider.notifier)
              .filter(
                search: v,
                status: ref.read(userListQueryProvider).status,
              ),
          onStatus: (v) =>
              ref.read(userListQueryProvider.notifier).filter(status: v),
        ),
        ...result.when(
          data: (data) => [
            ListPagination(
              page: ref.watch(userListQueryProvider).page,
              total: data.total,
              onPage: ref.read(userListQueryProvider.notifier).page,
            ),
            Text(l10n.adminUserCount(data.total)),
            const SizedBox(height: AppSpacing.medium),
            for (final user in data.items)
              _UserRow(
                user: user,
                isCurrent: user.id == currentUserId,
                onEdit: () => _editUser(context, ref, user),
              ),
          ],
          error: (_, _) => adminError(
            action: l10n.retryAction,
            title: l10n.loadFailedTitle,
            description: l10n.loadFailedDescription,
            retry: () => ref.invalidate(adminUsersProvider),
          ),
          loading: () => adminLoading(l10n.loadingData),
        ),
      ],
    );
  }

  Future<void> _editUser(
    BuildContext context,
    WidgetRef ref,
    ManagedUserResponse user,
  ) async {
    var role = user.role;
    var active = user.isActive;
    final save = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) {
          final l10n = AppLocalizations.of(context);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.xLarge,
                AppSpacing.medium,
                AppSpacing.xLarge,
                MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xLarge,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    user.username,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.large),
                  AppDropdownField<UserRole>(
                    value: role,
                    label: l10n.adminRoleLabel,
                    options: [
                      AppDropdownOption(
                        value: UserRole.user,
                        label: l10n.adminRoleUser,
                      ),
                      AppDropdownOption(
                        value: UserRole.admin,
                        label: l10n.adminRoleAdmin,
                      ),
                    ],
                    onSelected: (value) {
                      if (value != null) setSheetState(() => role = value);
                    },
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.adminAccountActive),
                    value: active,
                    onChanged: (value) => setSheetState(() => active = value),
                  ),
                  const SizedBox(height: AppSpacing.medium),
                  FilledButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(l10n.saveAction),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    if (save != true || !context.mounted) return;
    try {
      await ref.read(adminRepositoryProvider).updateUser(user, role, active);
      ref.invalidate(adminUsersProvider);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    }
  }
}

final class _UserRow extends StatelessWidget {
  const _UserRow({
    required this.isCurrent,
    required this.onEdit,
    required this.user,
  });

  final bool isCurrent;
  final VoidCallback onEdit;
  final ManagedUserResponse user;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(user.username),
      subtitle: Text(
        '${user.email}\n${user.role == UserRole.admin ? l10n.adminRoleAdmin : l10n.adminRoleUser} · '
        '${user.isActive ? l10n.adminAccountEnabled : l10n.adminAccountDisabled}',
      ),
      isThreeLine: true,
      trailing: isCurrent
          ? Text(l10n.adminCurrentUser)
          : IconButton(
              onPressed: onEdit,
              tooltip: l10n.editAction,
              icon: const Icon(LucideIcons.pencil, size: 18),
            ),
    );
  }
}
