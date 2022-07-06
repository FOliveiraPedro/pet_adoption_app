import '../../../domain/entities/entities.dart';
import '../../../shared/shared.dart';
import '../../errors/errors.dart';

class AnimalModel extends AnimalEntity {
  AnimalModel({required super.id,
    required super.name,
    required super.lifeSpan,
    required super.description,
    required super.temperament,
    required super.origin,
    required super.weight,
    required super.height,
    required super.imageUrl,
  });

  factory AnimalModel.fromMap({required Json map}) {
    try {
      return AnimalModel(
        id: map['id']?? '',
        name: map['name']?? '',
        lifeSpan: map['life_span']?? '',
        description: map['description']?? '',
        temperament: map['temperament']?? '',
        origin: map['origin']?? '',
        weight: map.containsKey('weight')? map['weight']['metric']: '',
        height: map.containsKey('height')? map['height']['metric']: '',
        imageUrl: map.containsKey('image')?map['image']['url'] ?? '': '',
      );
    } catch (e) {
      throw ModelError.remoteParseData();
    }
  }
}
