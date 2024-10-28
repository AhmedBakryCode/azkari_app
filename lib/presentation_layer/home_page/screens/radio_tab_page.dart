import 'package:Islami/core/provider/radio_provider.dart';
import 'package:Islami/presentation_layer/home_page/componenet/radio_items_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioTabPage extends StatelessWidget {
  const RadioTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioProvider = Provider.of<RadioProvider>(context);

    if (radioProvider.radios.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return RadioItemList(radios: radioProvider.radios);
  }
}
