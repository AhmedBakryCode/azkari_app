import 'package:Islami/domain/enities/surah.dart';
import 'package:flutter/material.dart';
import 'package:Islami/core/utils/colors.dart';

class MushaphPage extends StatelessWidget {
  final String title;
  final int page_number;
  //final Surah surah;

  const MushaphPage({
    Key? key,
    required this.title,
    required this.page_number, //required this.surah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create the list of image paths (1 to 604)
    final List<String> imagePaths = List.generate(
      604,
          (index) => 'assets/quran-images/${index + 1}.png',
    );

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: page_number),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(

                imagePaths[index-1],
                fit: BoxFit.fill, // Ensure the image fills the body
                width: double.infinity,
                height: double.infinity,
                color: AppColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
