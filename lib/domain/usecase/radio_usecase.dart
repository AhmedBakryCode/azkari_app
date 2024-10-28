import 'package:Islami/data/models/radio.dart';
import 'package:Islami/domain/enities/radio.dart';
import 'package:Islami/domain/repositories/radio_repo.dart';

class GetRadiosUseCase {
  final RadioRepository repository;

  GetRadiosUseCase(this.repository);

  Future<List<RadioModel>> call() {
    return repository.getAllRadios();
  }
}
