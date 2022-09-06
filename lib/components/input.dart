import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final String? placeholder;
  final IconData? suffixIcon;

  const Input({
    Key? key,
    required this.inputController,
    required this.label,
    this.placeholder,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: Icon(
            suffixIcon,
            color: Theme.of(context).primaryColorLight,
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
          hintText: placeholder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
      ),
    );
  }
}
