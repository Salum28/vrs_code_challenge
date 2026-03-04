// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Exchange Rate`
  String get exchange_rate_menu_title {
    return Intl.message(
      'Exchange Rate',
      name: 'exchange_rate_menu_title',
      desc: '',
      args: [],
    );
  }

  /// `Listings`
  String get listings_menu_title {
    return Intl.message(
      'Listings',
      name: 'listings_menu_title',
      desc: '',
      args: [],
    );
  }

  /// `Create a new exchange rate`
  String get exchange_rate_form_title {
    return Intl.message(
      'Create a new exchange rate',
      name: 'exchange_rate_form_title',
      desc: '',
      args: [],
    );
  }

  /// `Create your new listing`
  String get listing_form_title {
    return Intl.message(
      'Create your new listing',
      name: 'listing_form_title',
      desc: '',
      args: [],
    );
  }

  /// `BRL Value`
  String get brl_field_label {
    return Intl.message(
      'BRL Value',
      name: 'brl_field_label',
      desc: '',
      args: [],
    );
  }

  /// `USD Value`
  String get usd_field_label {
    return Intl.message(
      'USD Value',
      name: 'usd_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Listing Type`
  String get listing_type_field_label {
    return Intl.message(
      'Listing Type',
      name: 'listing_type_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get listing_type_label_option_one {
    return Intl.message(
      'Rent',
      name: 'listing_type_label_option_one',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get listing_type_label_option_two {
    return Intl.message(
      'Sale',
      name: 'listing_type_label_option_two',
      desc: '',
      args: [],
    );
  }

  /// `BRL Price`
  String get brl_price_field_label {
    return Intl.message(
      'BRL Price',
      name: 'brl_price_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zip_code_field_label {
    return Intl.message(
      'Zip Code',
      name: 'zip_code_field_label',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street_field_label {
    return Intl.message(
      'Street',
      name: 'street_field_label',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district_field_label {
    return Intl.message(
      'District',
      name: 'district_field_label',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city_field_label {
    return Intl.message('City', name: 'city_field_label', desc: '', args: []);
  }

  /// `State`
  String get state_field_label {
    return Intl.message('State', name: 'state_field_label', desc: '', args: []);
  }

  /// `Create Exchange Rate`
  String get exchange_rate_creation_button_label {
    return Intl.message(
      'Create Exchange Rate',
      name: 'exchange_rate_creation_button_label',
      desc: '',
      args: [],
    );
  }

  /// `Create Listing`
  String get listing_creation_button_label {
    return Intl.message(
      'Create Listing',
      name: 'listing_creation_button_label',
      desc: '',
      args: [],
    );
  }

  /// `Exchange Rate successfully created!`
  String get exchange_rate_creation_success {
    return Intl.message(
      'Exchange Rate successfully created!',
      name: 'exchange_rate_creation_success',
      desc: '',
      args: [],
    );
  }

  /// `Listing successfully created!`
  String get listing_creation_success {
    return Intl.message(
      'Listing successfully created!',
      name: 'listing_creation_success',
      desc: '',
      args: [],
    );
  }

  /// `Error while creating exchange rate`
  String get exchange_rate_creation_error {
    return Intl.message(
      'Error while creating exchange rate',
      name: 'exchange_rate_creation_error',
      desc: '',
      args: [],
    );
  }

  /// `Error while getting current exchange rate`
  String get get_current_exchange_rate_error {
    return Intl.message(
      'Error while getting current exchange rate',
      name: 'get_current_exchange_rate_error',
      desc: '',
      args: [],
    );
  }

  /// `Error while creating listing`
  String get listing_creation_error {
    return Intl.message(
      'Error while creating listing',
      name: 'listing_creation_error',
      desc: '',
      args: [],
    );
  }

  /// `Error while getting paginated listings`
  String get get_paginated_listings_error {
    return Intl.message(
      'Error while getting paginated listings',
      name: 'get_paginated_listings_error',
      desc: '',
      args: [],
    );
  }

  /// `Error while getting zip code`
  String get get_zip_code_error {
    return Intl.message(
      'Error while getting zip code',
      name: 'get_zip_code_error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
