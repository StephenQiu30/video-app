import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:framegrab/features/download/presentation/download_hero.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final class DownloadHomeContent extends StatelessWidget {
  const DownloadHomeContent({
    required this.busy,
    required this.controller,
    required this.error,
    required this.invalid,
    required this.mode,
    required this.onChanged,
    required this.onClear,
    required this.onModeChanged,
    required this.onSubmit,
    required this.onUploadAction,
    required this.result,
    required this.statusTone,
    required this.uploadState,
    super.key,
  });

  final bool busy;
  final TextEditingController controller;
  final String? error;
  final bool invalid;
  final ContentIntakeMode mode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final ValueChanged<ContentIntakeMode> onModeChanged;
  final VoidCallback onSubmit;
  final ValueChanged<ContentUploadKind> onUploadAction;
  final Widget? result;
  final DownloadNoticeTone statusTone;
  final ContentUploadState uploadState;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width > 640
        ? 32.0
        : AppSpacing.pageHorizontal;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              AppSpacing.pageTop,
              horizontalPadding,
              24,
            ),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DownloadHero(
                        busy: busy,
                        controller: controller,
                        invalid: invalid,
                        mode: mode,
                        onChanged: onChanged,
                        onClear: onClear,
                        onModeChanged: onModeChanged,
                        onSubmit: onSubmit,
                        onUploadAction: onUploadAction,
                        uploadState: uploadState,
                      ),
                      if (error != null) ...[
                        const SizedBox(height: 24),
                        DownloadInlineStatus(message: error!, tone: statusTone),
                      ],
                      if (result != null) ...[
                        const SizedBox(height: 32),
                        result!,
                      ],
                      const SizedBox(height: 64),
                      if (mode == ContentIntakeMode.link)
                        const DownloadTrustFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
