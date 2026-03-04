import 'package:flutter/material.dart';
import 'package:rent_app/generated/l10n.dart';
import 'package:rent_app/ui/core/ui/buttons/generic_filled_button.dart';
import 'package:rent_app/ui/core/ui/text_fields/generic_dropdown_menu.dart';
import 'package:rent_app/ui/core/ui/text_fields/generic_text_field.dart';
import 'package:rent_app/utils/formatters/address_formatters.dart';

class ListingCreationForm extends StatefulWidget {
  const ListingCreationForm({super.key});

  @override
  State<ListingCreationForm> createState() => _ListingCreationFormState();
}

class _ListingCreationFormState extends State<ListingCreationForm> {
  final TextEditingController _listingTypeFieldController = TextEditingController();
  final TextEditingController _brlPriceFieldController = TextEditingController();
  final TextEditingController _zipCodeFieldController = TextEditingController();
  final TextEditingController _streetFieldController = TextEditingController();
  final TextEditingController _districtFieldController = TextEditingController();
  final TextEditingController _cityFieldController = TextEditingController();
  final TextEditingController _stateFieldController = TextEditingController();
  bool _showlistingTypeError = false;
  bool _showBrlPriceError = false;
  bool _showZipCodeError = false;
  bool _showStreetError = false;
  bool _showDistrictError = false;
  bool _showCityError = false;
  bool _showStateError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 10,
      children: [
        SizedBox(height: 5),
        GenericDropdownMenu(
          controller: _listingTypeFieldController, 
          itemList: [
            S.of(context).listing_type_field_label, 
            S.of(context).listing_type_label_option_one, 
            S.of(context).listing_type_label_option_two
          ], 
          widthFactor: 5, 
          fieldIcon: Icons.sell, 
          showError: _showlistingTypeError
        ),
        GenericTextField(
          fieldController: _brlPriceFieldController, 
          inputType: TextInputType.number, 
          fieldLabel: S.of(context).brl_price_field_label, 
          prefixIcon: Icons.monetization_on, 
          showError: _showBrlPriceError
        ),
        GenericTextField(
          fieldController: _zipCodeFieldController, 
          inputType: TextInputType.text, 
          fieldLabel: S.of(context).zip_code_field_label, 
          prefixIcon: Icons.signpost, 
          showError: _showZipCodeError,
          formatters: [PostalCodeFormatter()],
        ),
        GenericTextField(
          fieldController: _streetFieldController, 
          inputType: TextInputType.text, 
          fieldLabel: S.of(context).street_field_label, 
          prefixIcon: Icons.home, 
          showError: _showStreetError,
        ),
        GenericTextField(
          fieldController: _districtFieldController, 
          inputType: TextInputType.text, 
          fieldLabel: S.of(context).district_field_label, 
          prefixIcon: Icons.maps_home_work_sharp, 
          showError: _showDistrictError,
        ),
        GenericTextField(
          fieldController: _cityFieldController, 
          inputType: TextInputType.text, 
          fieldLabel: S.of(context).city_field_label, 
          prefixIcon: Icons.location_city, 
          showError: _showCityError,
        ),
        GenericTextField(
          fieldController: _stateFieldController, 
          inputType: TextInputType.text, 
          fieldLabel: S.of(context).state_field_label, 
          prefixIcon: Icons.flag, 
          showError: _showStateError,
        ),
        GenericFilledButton(
          buttonText: S.of(context).listing_creation_button_label,
          buttonFunction: () {}
        )
      ],
    );
  }
}