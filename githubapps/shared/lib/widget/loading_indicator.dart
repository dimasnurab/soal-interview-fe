import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  const LoadingIndicator({this.size = 24, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(strokeWidth: 2)
          : const CupertinoActivityIndicator(),
    );
  }
}
