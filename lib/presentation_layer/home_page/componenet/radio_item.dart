import 'package:Islami/core/provider/radio_provider.dart';
import 'package:Islami/data/models/radio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/colors.dart';

class RadioItem extends StatelessWidget {
  final RadioModel radio;

  const RadioItem({Key? key, required this.radio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioProvider = Provider.of<RadioProvider>(context);
    final isActive = radioProvider.activeRadioUrl == radio.url;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Image.asset(
              isActive ? ImageAssets.radio_running : ImageAssets.mosque2,
              fit: BoxFit.cover,
              color: const Color(0xFFC3A570),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Text(

                        radio.name,
maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.fade,
                          color: AppColors.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () =>
                            radioProvider.playPauseRadio(radio.url),
                        icon: Icon(
                          isActive ? Icons.pause : Icons.play_arrow_rounded,
                          color: AppColors.secondary,
                          size: 50,
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: radioProvider.toggleMute,
                        icon: Icon(
                          radioProvider.isMuted
                              ? Icons.volume_off
                              : Icons.volume_up,
                          color: AppColors.secondary,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
