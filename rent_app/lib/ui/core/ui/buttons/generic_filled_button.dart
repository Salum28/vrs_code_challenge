// Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericFilledButton extends StatefulWidget {
  const GenericFilledButton({
    super.key,
    required this.buttonText,
    required this.buttonFunction
  });

  final String buttonText;
  final Function() buttonFunction;

  @override
  State<GenericFilledButton> createState() => _GenericFilledButtonState();
}

class _GenericFilledButtonState extends State<GenericFilledButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.buttonFunction,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondary),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 20))
      ),
      child: Text(
        widget.buttonText,
        style: GoogleFonts.getFont(
          'Rubik',
          textStyle: const TextStyle(color: Colors.white, fontSize: 16)
        )
      )
    );
  }
}