import 'package:Islami/data/datasource/radio_datasource.dart';
import 'package:Islami/data/models/radio.dart';
import 'package:Islami/domain/enities/radio.dart';
import 'package:Islami/domain/repositories/radio_repo.dart';
class RadioRepositoryImpl implements RadioRepository {
  final RemoteDataSource remoteDataSource;

  RadioRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<RadioModel>> getAllRadios() {
    return remoteDataSource.fetchRadios();
  }
}
