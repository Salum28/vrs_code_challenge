import 'package:flutter/material.dart';
import 'package:rent_app/generated/l10n.dart';
import 'package:rent_app/ui/listing/widgets/listing_creation_form.dart';

class ListingCreationScreen extends StatefulWidget {
  const ListingCreationScreen({super.key});

  @override
  State<ListingCreationScreen> createState() => _ListingCreationScreenState();
}

class _ListingCreationScreenState extends State<ListingCreationScreen> {
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
                  S.of(context).listing_form_title
                ),
                SizedBox(height: 20),
                ListingCreationForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}