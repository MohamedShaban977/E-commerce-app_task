import 'package:flutter/material.dart';

class UnFocusedKeyboard extends StatelessWidget {
  final Widget child;

  const UnFocusedKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
