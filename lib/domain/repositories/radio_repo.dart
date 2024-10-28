import 'package:Islami/data/models/radio.dart';
import 'package:Islami/domain/enities/radio.dart';

abstract class RadioRepository {
  Future<List<RadioModel>> getAllRadios();
}
