// Imports
import 'package:flutter/material.dart';

class GenericDropdownMenu extends StatefulWidget {
  const GenericDropdownMenu({
    super.key,
    required this.controller,
    required this.itemList,
    required this.widthFactor,
    required this.fieldIcon,
    required this.showError
  });

  final TextEditingController controller;
  final List<String> itemList;
  final num widthFactor;
  final IconData fieldIcon;
  final bool showError;

  @override
  State<GenericDropdownMenu> createState() => _GenericDropdownMenuState();
}

class _GenericDropdownMenuState extends State<GenericDropdownMenu> {
  final FocusNode _menuFocusNode = FocusNode();
  late bool _hasError;  
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _hasError = widget.showError;
    _selectedValue = widget.itemList.isNotEmpty ? widget.itemList.first : null;
    _menuFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if(!mounted) return;

    if(_menuFocusNode.hasFocus) {
      setState(() {
        _hasError = false;
      });
    }
  }
  
  @override
  void dispose() {
    _menuFocusNode.removeListener(_handleFocusChange);
    _menuFocusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    if(widget.itemList.isEmpty) {
      return const SizedBox.shrink();
    }
    
    return DropdownMenu(
      controller: widget.controller,
      focusNode: _menuFocusNode,
      width: MediaQuery.of(context).size.width * widget.widthFactor.toDouble(),
      initialSelection: widget.itemList.first,
      leadingIcon: Icon(
        widget.fieldIcon,
        color: _hasError ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary
      ),
      onSelected: (String? value) {
        if(value != null && mounted) {
          setState(() {
            _selectedValue = value;
          });
        }
      },
      
      // Dropdown Values
      dropdownMenuEntries: widget.itemList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList()
    );
  }
}