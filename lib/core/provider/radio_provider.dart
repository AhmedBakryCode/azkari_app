import 'package:Islami/data/models/radio.dart';
import 'package:Islami/domain/usecase/radio_usecase.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioProvider with ChangeNotifier {
  final GetRadiosUseCase getRadiosUseCase;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<RadioModel> radios = [];
  bool isPlaying = false;
  bool isMuted = false;
  String? activeRadioUrl;

  RadioProvider(this.getRadiosUseCase) {
    _fetchRadios();
  }

  Future<void> _fetchRadios() async {
    radios = await getRadiosUseCase();
    notifyListeners();
  }

  Future<void> playPauseRadio(String url) async {
    if (isPlaying && activeRadioUrl == url) {
      await _audioPlayer.pause();
      isPlaying = false;
    } else {
      await _audioPlayer.play(UrlSource(url));
      activeRadioUrl = url;
      isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> toggleMute() async {
    isMuted = !isMuted;
    await _audioPlayer.setVolume(isMuted ? 0.0 : 1.0);
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
