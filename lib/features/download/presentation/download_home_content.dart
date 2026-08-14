import 'package:flutter/material.dart';
import 'package:framegrab/features/download/presentation/download_hero.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';

final class DownloadHomeContent extends StatelessWidget {
  const DownloadHomeContent({
    required this.busy,
    required this.controller,
    required this.error,
    required this.invalid,
    required this.onChanged,
    required this.onClear,
    required this.onSubmit,
    required this.statusTone,
    super.key,
  });

  final bool busy;
  final TextEditingController controller;
  final String? error;
  final bool invalid;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final VoidCallback onSubmit;
  final DownloadNoticeTone statusTone;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = MediaQuery.sizeOf(context).width > 640
        ? 32.0
        : 16.0;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              40,
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
                        onChanged: onChanged,
                        onClear: onClear,
                        onSubmit: onSubmit,
                      ),
                      if (error != null) ...[
                        const SizedBox(height: 24),
                        DownloadInlineStatus(message: error!, tone: statusTone),
                      ],
                      const SizedBox(height: 64),
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
