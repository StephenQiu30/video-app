import 'package:flutter/material.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';

final class DownloadAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DownloadAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 16,
      toolbarHeight: 80,
      title: const AppBrand(),
    );
  }
}
