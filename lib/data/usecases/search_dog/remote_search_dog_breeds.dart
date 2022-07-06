import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../domain/usecases/usecases.dart';
import '../../errors/errors.dart';
import '../../http/http.dart';
import '../../models/models.dart';

class RemoteSearchDogBreeds implements SearchDogBreedsUsecase {
  final String url;
  final HttpClient client;

  RemoteSearchDogBreeds({
    required this.url,
    required this.client,
  });

  @override
  Future<List<AnimalEntity>> call() async {
    try {
      final response = await client.request(
        url: url,
        method: Method.get,
        headers: {'x-api-key': 'c6c54335-17dd-49a8-b311-0cefea25efe2'},
      );
      final List<AnimalEntity> list = [];
      for(var item in response){
        list.add(AnimalModel.fromMap(map: item));
      }
      return list;
    } on HttpError catch (error) {
      throw error.toDomainError();
    } catch (error) {
      throw error;
    }
  }
}
