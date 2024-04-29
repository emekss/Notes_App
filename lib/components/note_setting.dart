import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  const NoteSettings({
    super.key,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit option
        GestureDetector(
          onTap: onEditTap,
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),

        //delete option
        GestureDetector(
          onTap: onDeleteTap,
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
