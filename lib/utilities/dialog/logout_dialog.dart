import 'package:flutter/material.dart';
import 'package:sokyo/utilities/dialog/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: 'Log out',
      content: "Are you sure you want to log out?",
      optionBuilder: () => {
            'Cancel': false,
            'Log out': true,
          }).then((value) => value ?? false);
}
