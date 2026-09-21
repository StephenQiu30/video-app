import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('presentation code cannot reintroduce Material visual controls', () {
    final forbidden = RegExp(
      r'\b(?:MaterialButton|FilledButton|ElevatedButton|OutlinedButton|TextButton|IconButton|FloatingActionButton|TextField|TextFormField|DropdownButton|DropdownButtonFormField|DropdownMenu|SwitchListTile|Switch|CheckboxListTile|Checkbox|RadioListTile|Radio|Slider|RangeSlider|ChoiceChip|FilterChip|ActionChip|InputChip|SegmentedButton|TabBar|NavigationBar|BottomNavigationBar|ListTile|ExpansionTile|PopupMenuButton|MenuAnchor|AlertDialog|SimpleDialog|SnackBar|MaterialBanner|CircularProgressIndicator|LinearProgressIndicator|SlidableAction|CustomSlidableAction|showModalBottomSheet|showDialog|showAdaptiveDialog)\s*(?:<[^>]+>)?\s*(?:\.\w+)?\s*\(',
    );
    final violations = <String>[];
    for (final file
        in Directory('lib')
            .listSync(recursive: true)
            .whereType<File>()
            .where((file) => file.path.endsWith('.dart'))) {
      if (forbidden.hasMatch(file.readAsStringSync())) {
        violations.add(file.path);
      }
    }
    expect(
      violations,
      isEmpty,
      reason: 'Use shadcn_ui controls; Material is infrastructure only.',
    );
  });
}
