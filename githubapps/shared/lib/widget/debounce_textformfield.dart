import 'dart:async';
import 'package:flutter/material.dart';

class DebounceTextFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final int debounceMilliseconds;

  const DebounceTextFormField({
    super.key,
    required this.onChanged,
    this.hintText,
    this.debounceMilliseconds = 500,
  });

  @override
  State<DebounceTextFormField> createState() => _DebounceTextFormFieldState();
}

class _DebounceTextFormFieldState extends State<DebounceTextFormField> {
  Timer? _debounce;

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: widget.debounceMilliseconds), () {
      widget.onChanged(value);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText ?? "pencarian ...",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onChanged: _onChanged,
    );
  }
}
