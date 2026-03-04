import 'package:rent_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenericPasswordField extends StatefulWidget {
  const GenericPasswordField({
    super.key,
    required this.fieldController,
    required this.fieldLabel,
    required this.showError,
  });

  final TextEditingController? fieldController;
  final String? fieldLabel;
  final bool? showError;

  @override
  State<GenericPasswordField> createState() => _GenericPasswordFieldState();
}

class _GenericPasswordFieldState extends State<GenericPasswordField> {
  IconData _passwordEye = Icons.visibility_off;
  Color _passwordEyeColor = AppColors.darkBlue;
  bool _obscureController = true;
  late bool _hasError;
  final FocusNode _fieldFocusNode = FocusNode();

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
  void didUpdateWidget(covariant GenericPasswordField oldWidget) {
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
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureController,
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
            fontSize: 16,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: _hasError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary,
        ),
        suffixIcon: TextButton.icon(
          onPressed: () {
            if(_obscureController) {
              setState(() {
                _passwordEye = Icons.visibility;
                _passwordEyeColor = Theme.of(context).colorScheme.primary;
                _obscureController = false;
              });
            } else {
              setState(() {
                _passwordEye = Icons.visibility_off;
                _passwordEyeColor = Theme.of(context).colorScheme.secondary;
                _obscureController = true;
              });
            }
          }, 
          label: Icon(
            _passwordEye,
            color: _hasError ? Theme.of(context).colorScheme.error : _passwordEyeColor,
          )
        ),
        error: _hasError ? SizedBox.shrink() : null
      ),
    );
  }
}