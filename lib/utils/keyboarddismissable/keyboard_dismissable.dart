import 'package:flutter/widgets.dart';

class KeyBoardDismissible extends StatelessWidget {
  final Widget child;

  const KeyBoardDismissible({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: child);
  }
}
