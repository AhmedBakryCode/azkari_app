import 'package:Islami/data/models/reciter.dart';
import 'package:Islami/data/repository/reciter_repo.dart';

class FetchRecitersUseCase {
  final RecitersRepository repository;

  FetchRecitersUseCase(this.repository);

  Future<List<Reciter>> call() async {
    return await repository.fetchReciters();
  }
}
