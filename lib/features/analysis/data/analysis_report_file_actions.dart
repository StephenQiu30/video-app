import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:share_plus/share_plus.dart';

abstract interface class AnalysisReportFileActions {
  Future<void> download({required String markdown, required String title});

  Future<void> export({
    required String markdown,
    required Rect shareOrigin,
    required String title,
  });
}

final class NativeAnalysisReportFileActions
    implements AnalysisReportFileActions {
  const NativeAnalysisReportFileActions();

  @override
  Future<void> download({required String markdown, required String title}) =>
      FlutterFileSaver().writeFileAsString(
        fileName: analysisReportFileName(title),
        data: _normalizedMarkdown(markdown),
      );

  @override
  Future<void> export({
    required String markdown,
    required Rect shareOrigin,
    required String title,
  }) async {
    final fileName = analysisReportFileName(title);
    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(
            utf8.encode(_normalizedMarkdown(markdown)),
            mimeType: 'text/markdown',
            name: fileName,
          ),
        ],
        fileNameOverrides: [fileName],
        sharePositionOrigin: shareOrigin,
        subject: title,
        title: title,
      ),
    );
  }
}

String analysisReportFileName(String title) {
  final sanitized = title
      .trim()
      .replaceAll(RegExp(r'[<>:"/\\|?*\u0000-\u001F]'), '-')
      .replaceAll(RegExp(r'\s+'), ' ')
      .replaceAll(RegExp(r'-+'), '-')
      .trim();
  final safeTitle = sanitized.isEmpty
      ? 'FrameFetch'
      : String.fromCharCodes(sanitized.runes.take(48));
  return '$safeTitle-analysis-report.md';
}

String _normalizedMarkdown(String markdown) => '${markdown.trim()}\n';
