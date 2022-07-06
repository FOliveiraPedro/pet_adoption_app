import 'package:equatable/equatable.dart';

class AnimalEntity extends Equatable {
  final String id;
  final String name;
  final String lifeSpan;
  final String description;
  final String temperament;
  final String origin;
  final String weight;
  final String height;
  final String imageUrl;

  const AnimalEntity({
    required this.id,
    required this.name,
    required this.lifeSpan,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.weight,
    required this.height,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id,name, lifeSpan, description, temperament,origin, weight, height,imageUrl];
}
