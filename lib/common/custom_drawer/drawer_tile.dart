import 'package:flutter/material.dart';
import 'package:loja_virtual/models/page_manager.dart';
import 'package:provider/provider.dart';

/// DrawerTitle
@immutable
class DrawerTile extends StatelessWidget {

  /// DrawerTile's constructor
  const DrawerTile({
    this.iconData,
    this.title,
    this.page
  });

  /// DrawerTile's Icon
  final IconData iconData;

  /// DrawerTile's Title
  final String title;

  /// DrawerTile's page number
  final int page;

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<PageManager>().page;
    final Color color = currentPage == page ? Colors.red : Colors.grey[700];

    return InkWell(
      onTap: () => context.read<PageManager>().page = page,
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}
