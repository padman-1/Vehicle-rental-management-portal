import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(
    {required BuildContext context,
    required String message,
    String? title}) async {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      actions: [
        _adaptiveAction(
          context: context,
          onPressed: () => Navigator.pop(
            context,
          ),
          child: const Text('OK'),
        )
      ],
      title: Text(title ?? 'Error'),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Text(
                message,
                maxLines: 10,
              )),
        ],
      ),
    ),
  );
}

Widget _adaptiveAction(
    {required BuildContext context,
    required VoidCallback onPressed,
    required Widget child}) {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return TextButton(onPressed: onPressed, child: child);
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return CupertinoDialogAction(onPressed: onPressed, child: child);
  }
}
