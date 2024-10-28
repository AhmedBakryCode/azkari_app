import 'dart:convert';
import 'package:Islami/data/models/reciter.dart';
import 'package:Islami/domain/enities/surah.dart';
import 'package:Islami/domain/usecase/reciter_secase.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class ReciterProvider with ChangeNotifier {
  final FetchRecitersUseCase fetchRecitersUseCase;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Reciter> _reciters = [];
  List<Surah> _suwar = [];

  bool _isLoading = false;
  bool isPlaying = false;
  String? activeSurahUrl; // Track the currently playing surah URL

  ReciterProvider(this.fetchRecitersUseCase) {
    _loadSuwarFromAssets();
    _fetchReciters();
  }
  List<Surah> get suwar => _suwar;

  List<Reciter> get reciters => _reciters;
  bool get isLoading => _isLoading;

  Future<void> _fetchReciters() async {
    _isLoading = true;
    notifyListeners();

    try {
      _reciters = await fetchRecitersUseCase();
    } catch (e) {
      print('Failed to fetch reciters: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
  Future<void> _loadSuwarFromAssets() async {
    _isLoading = true;
    notifyListeners();

    try {
      final String response = await rootBundle.loadString('assets/suwar.json');
      final List<dynamic> jsonData = jsonDecode(response)['suwar'];
      _suwar = Surah.fromJsonList(jsonData);
    } catch (e) {
      print('Failed to load suwar: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
  Future<void> playPauseSurah(String url) async {
    // If the same surah is playing, pause it
    if (isPlaying && activeSurahUrl == url) {
      await _audioPlayer.pause();
      isPlaying = false;
      activeSurahUrl = null; // Clear active URL
    } else {
      // Stop previous audio if any and play the new one
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      activeSurahUrl = url;
      isPlaying = true;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
