import 'package:day_i/generated/l10n.dart';
import 'package:flutter/material.dart';

class PathNotFound extends StatelessWidget {
  const PathNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(S.current.pathNotFound)),
    );
  }
}
