
import 'package:Islami/core/services/reciter_services.dart';
import 'package:Islami/data/models/reciter.dart';

class RecitersRepository {
  final ApiService apiService;

  RecitersRepository(this.apiService);

  Future<List<Reciter>> fetchReciters() async {
    final data = await apiService.fetchReciters();
    return List<Reciter>.from(
      data['reciters'].map((reciter) => Reciter.fromJson(reciter)),
    );
  }
}
