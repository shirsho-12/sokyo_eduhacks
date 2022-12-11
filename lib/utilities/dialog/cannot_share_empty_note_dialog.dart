import 'package:flutter/material.dart';

import 'package:sokyo/utilities/dialog/generic_dialog.dart';

Future<void> cannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: 'You cannot share an empty note!',
    optionBuilder: () => {
      'OK': null,
    },
  );
}
