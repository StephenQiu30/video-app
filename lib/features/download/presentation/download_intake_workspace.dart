import 'package:flutter/material.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/inspection_workspace.dart';
import 'package:framegrab/features/download/presentation/source_discovery_workspace.dart';

final class DownloadIntakeWorkspace extends StatelessWidget {
  const DownloadIntakeWorkspace({
    required this.onCreate,
    required this.onSelectFormat,
    required this.onSelectItem,
    required this.state,
    super.key,
  });

  final VoidCallback onCreate;
  final ValueChanged<String> onSelectFormat;
  final ValueChanged<String> onSelectItem;
  final DownloadIntakeState state;

  @override
  Widget build(BuildContext context) {
    final inspection = state.inspection;
    final discovery = state.discovery;
    if (inspection != null) {
      return InspectionWorkspace(
        onCreate: onCreate,
        onSelectFormat: onSelectFormat,
        state: state,
      );
    }
    if (discovery != null) {
      return SourceDiscoveryWorkspace(
        busy: state.busy,
        discovery: discovery,
        onSelect: onSelectItem,
      );
    }
    return const SizedBox.shrink();
  }
}
