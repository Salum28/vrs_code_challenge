import 'package:flutter/material.dart';
import 'package:rent_app/generated/l10n.dart';
import 'package:rent_app/ui/exchange_rate/widgets/exchange_rate_creation_form.dart';

class ExchangeRateCreationScreen extends StatefulWidget {
  const ExchangeRateCreationScreen({super.key});

  @override
  State<ExchangeRateCreationScreen> createState() => _ExchangeRateCreationScreenState();
}

class _ExchangeRateCreationScreenState extends State<ExchangeRateCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  S.of(context).exchange_rate_form_title
                ),
                SizedBox(height: 20),
                ExchangeRateCreationForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}