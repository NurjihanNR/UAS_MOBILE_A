import 'package:flutter/material.dart';
import 'package:projek_uts/datadata.dart';
import 'package:projek_uts/models/list_tile.dart';

class sidebar extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onKategori;
  final void Function()? onSignOut;
  const sidebar(
      {super.key, this.onProfileTap, this.onKategori, this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 239, 200, 128),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.person,
                color: Colors.black,
                size: 64,
              )),
              listtile(
                  icon: Icons.home,
                  text: 'H O M E',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => data()))),
              listtile(
                  icon: Icons.person,
                  text: 'P R O F I L E',
                  onTap: onProfileTap),
              listtile(icon: Icons.list, text: 'M E R E K', onTap: onKategori),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: listtile(
                icon: Icons.logout, text: 'L O G O U T', onTap: onSignOut),
          )
        ],
      ),
    );
  }
}
