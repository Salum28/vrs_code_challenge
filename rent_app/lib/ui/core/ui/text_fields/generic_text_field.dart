import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    super.key,
    required this.fieldController,
    required this.inputType,
    required this.fieldLabel,
    required this.prefixIcon,
    required this.showError,
    this.onSubmitted,
    this.formatters,
  });

  final TextEditingController? fieldController;
  final TextInputType? inputType;
  final String? fieldLabel;
  final IconData? prefixIcon;
  final bool? showError;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? formatters;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  final FocusNode _fieldFocusNode = FocusNode();
  late bool _hasError;

  @override
  void initState() {
    super.initState();
    _hasError = widget.showError ?? false;
    _fieldFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if(!mounted) return;
    if(_fieldFocusNode.hasFocus) {
      setState(() {
        _hasError = false;
      });
    }
  }

  @override
  void didUpdateWidget(covariant GenericTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.showError != widget.showError) {
      _hasError = widget.showError ?? false;
    }
  }

  @override
  void dispose() {
    _fieldFocusNode.removeListener(_handleFocusChange);
    _fieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fieldController,
      focusNode: _fieldFocusNode,
      keyboardType: widget.inputType,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.formatters,
      decoration: InputDecoration(
        label: Text(widget.fieldLabel!),
        labelStyle: GoogleFonts.getFont(
          'Noto Serif',
          textStyle: TextStyle(
            color: _hasError 
              ? Theme.of(context).colorScheme.error 
              : (_fieldFocusNode.hasFocus 
                ? Theme.of(context).inputDecorationTheme.focusedBorder!.borderSide.color 
                : Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color),
            fontSize: 16 
          )
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: _hasError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
        ),
        error: _hasError ? const SizedBox.shrink() : null
      ),
    );
  }
}