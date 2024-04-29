import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //header
          DrawerHeader(child: Icon(Icons.note)),

          //notes title
          DrawerTile(
            leading: Icon(Icons.home),
            onTap: () {},
            title: 'Notes',
          ),

          //setting tile
          DrawerTile(
            leading: Icon(Icons.settings),
            onTap: () {},
            title: 'Settings',
          )
        ],
      ),
    );
  }
}
