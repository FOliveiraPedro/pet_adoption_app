import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteSearchCatBreeds implements SearchCatBreedsUsecase {
  final String url;
  final HttpClient client;

  RemoteSearchCatBreeds({
    required this.url,
    required this.client,
  });

  @override
  Future<List<AnimalEntity>> call() async {
    try {
      final response = await client.request(
        url: url,
        method: Method.get,
        headers: {'x-api-key': 'd34a6837-a194-4b39-b928-8938e9632d53'},
      );
      final List<AnimalEntity> list = [];
      for(var item in response){
        list.add(AnimalModel.fromMap(map: item));
      }
      return list;
    } catch (error) {
      throw error;
    }
  }
}
