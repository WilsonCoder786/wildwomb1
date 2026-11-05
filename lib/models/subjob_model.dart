import 'package:hive/hive.dart';

part 'subjob_model.g.dart';

@HiveType(typeId: 2)
class SubJobModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String categoryId;

  @HiveField(2)
  final String name;

  SubJobModel({
    required this.id,
    required this.categoryId,
    required this.name,
  });
}
