import 'package:flutter/material.dart';
import 'package:rent_app/generated/l10n.dart';
import 'package:rent_app/ui/core/ui/buttons/generic_filled_button.dart';
import 'package:rent_app/ui/core/ui/text_fields/generic_text_field.dart';

class ExchangeRateCreationForm extends StatefulWidget {
  const ExchangeRateCreationForm({super.key});

  @override
  State<ExchangeRateCreationForm> createState() => _ExchangeRateCreationFormState();
}

class _ExchangeRateCreationFormState extends State<ExchangeRateCreationForm> {
  final TextEditingController _brlValueFieldController = TextEditingController();
  final TextEditingController _usdValueFieldController = TextEditingController();
  bool _showBrlValueError = false;
  bool _showUsdValueError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        SizedBox(height: 5),
        GenericTextField(
          fieldController: _brlValueFieldController, 
          inputType: TextInputType.number, 
          fieldLabel: S.of(context).brl_field_label, 
          prefixIcon: Icons.monetization_on, 
          showError: _showBrlValueError
        ),
        GenericTextField(
          fieldController: _usdValueFieldController, 
          inputType: TextInputType.number, 
          fieldLabel: S.of(context).usd_field_label, 
          prefixIcon: Icons.monetization_on, 
          showError: _showUsdValueError
        ),
        GenericFilledButton(
          buttonText: S.of(context).exchange_rate_creation_button_label,
          buttonFunction: () {}
        )
      ],
    );
  }
}