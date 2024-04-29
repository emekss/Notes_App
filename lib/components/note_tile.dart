import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'note_setting.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          trailing: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              onPressed: () => showPopover(
                backgroundColor: Theme.of(context).colorScheme.background,
                width: 100,
                height: 100,
                context: context,
                bodyBuilder: (context) => NoteSettings(
                  onEditTap: () => onEditPressed,
                  onDeleteTap: () => onDeletePressed,
                ),
              ),
            ),
          )),
    );
  }
}
