import 'package:Islami/presentation_layer/home_page/componenet/reciter_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/reciter_provider.dart';

class ReciterTabPage extends StatelessWidget {
  const ReciterTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reciterProvider = context.watch<ReciterProvider>();

    if (reciterProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (reciterProvider.reciters.isEmpty) {
      return const Center(child: Text('No reciters found.'));
    }

    return ReciterItemList(reciters: reciterProvider.reciters);
  }
}
