import 'package:Islami/data/models/radio.dart';
import 'package:flutter/material.dart';
import 'radio_item.dart';

class RadioItemList extends StatelessWidget {
  final List<RadioModel> radios;

  const RadioItemList({Key? key, required this.radios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: radios.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: RadioItem(radio: radios[index]),
        );
      },
    );
  }
}
