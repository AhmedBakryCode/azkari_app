import 'package:flutter/material.dart';
import 'package:Islami/data/models/reciter.dart';
import 'rreciter_item.dart';

class ReciterItemList extends StatelessWidget {
  final List<Reciter> reciters;

  const ReciterItemList({Key? key, required this.reciters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reciters.length,
      itemBuilder: (context, index) {
        return ReciterItem(reciter: reciters[index]);
      },
    );
  }
}
