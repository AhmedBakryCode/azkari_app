import 'package:Islami/core/provider/reciter_provider.dart';
import 'package:Islami/core/utils/assets.dart';
import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/data/models/reciter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReciterSurahListPage extends StatelessWidget {
  final Reciter reciter;

  const ReciterSurahListPage({Key? key, required this.reciter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reciterProvider = context.watch<ReciterProvider>(); // Listen to changes
    final String serverUrl = reciter.moshaf[0].server;
    final suwar = reciterProvider.suwar;

    return Scaffold(

      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background3,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                        onPressed: () {
                          Navigator.pop(context); // Navigate to the previous page
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${reciter.name} - Surahs',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),


                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 114, // Total surahs
                  itemBuilder: (context, index) {
                    final surah = suwar[index];

                    final surahId = (index + 1).toString().padLeft(3, '0'); // Format ID to 3 digits
                    final surahUrl = '$serverUrl$surahId.mp3';
                    final isPlayingCurrent = reciterProvider.activeSurahUrl == surahUrl && reciterProvider.isPlaying;

                    return ListTile(
                      title: Text(surah.name,style: TextStyle(color: AppColors.primary),),
                      trailing: IconButton(
                        icon: Icon(isPlayingCurrent ? Icons.pause : Icons.play_arrow,color:AppColors.primary,),
                        onPressed: () {
                          reciterProvider.playPauseSurah(surahUrl); // Play/pause functionality
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
