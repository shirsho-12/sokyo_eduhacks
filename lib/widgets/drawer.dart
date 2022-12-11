import 'package:flutter/material.dart';
import 'package:sokyo/models/user.dart';

Drawer sokyoDrawer(User user, BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          // decoration: null,
          accountName: Text(user.name),
          accountEmail: Text(user.userName),
          currentAccountPicture: CircleAvatar(
            // backgroundImage: NetworkImage(user.userAvatarLink),
            backgroundImage: AssetImage(user.userAvatarLink),
            backgroundColor: Colors.white,
          ),
          onDetailsPressed: () =>
              Navigator.popAndPushNamed(context, '/profile'),
        ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 16.0),
        //   child: Text("TOOLS"),
        // ),
        ListTile(
          // dense: true,
          leading: const Icon(Icons.lightbulb, color: Colors.black),
          title: const Text(
            'Home',
          ),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          // minLeadingWidth: 12,
          onTap: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.group, color: Colors.black),
          title: const Text('Groups'),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.popAndPushNamed(context, '/groups');
          },
        ),
        ListTile(
          leading: const Icon(Icons.collections_bookmark_rounded,
              color: Colors.black),
          title: const Text('Courses'),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          onTap: () {
            Navigator.popAndPushNamed(context, '/courses');
          },
        ),
        ListTile(
          leading: const Icon(Icons.person, color: Colors.black),
          title: const Text('Study Buddy'),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          onTap: () {
            Navigator.popAndPushNamed(context, '/buddy');
          },
        ),
        const Divider(
          color: Colors.black,
          indent: 12,
          endIndent: 12,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Text("ABOUT"),
        ),
        ListTile(
          title: const Text('About us'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Help'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Contact us'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Privacy and security'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
