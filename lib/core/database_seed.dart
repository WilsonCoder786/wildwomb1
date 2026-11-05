import 'package:easy_four_diy/models/category_model.dart';
import 'package:easy_four_diy/models/subjob_model.dart';
import 'package:easy_four_diy/core/services/hive_service.dart';
import 'package:uuid/uuid.dart';

class DatabaseSeed {
  static Future<void> seedIfEmpty() async {
    final categoryBox = HiveService.categoryBox;
    final subJobBox = HiveService.subJobBox;

    if (categoryBox.isNotEmpty) {
      return; // Already seeded
    }

    final uuid = Uuid();

    final Map<String, String> categories = {
      'Carpentry': 'carpentry_icon',
      'Painting': 'painting_icon',
      'Flooring': 'flooring_icon',
      'Plumbing': 'plumbing_icon',
      'Electrical': 'electrical_icon',
      'Gardening': 'gardening_icon',
      'Roofing': 'roofing_icon',
      'Tiling': 'tiling_icon',
    };

    for (var entry in categories.entries) {
      final categoryName = entry.key;
      final categoryIcon = entry.value;
      final categoryId = uuid.v4();

      final category = CategoryModel(
        id: categoryId,
        name: categoryName,
        icon: categoryIcon,
      );
      await categoryBox.put(categoryId, category);

      // Generate 20 dummy subjobs for each category
      for (int i = 1; i <= 20; i++) {
        final subJobId = uuid.v4();
        final subJob = SubJobModel(
          id: subJobId,
          categoryId: categoryId,
          name: '$categoryName Task $i',
        );
        await subJobBox.put(subJobId, subJob);
      }
    }
  }
}
