import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String loginMethod;

  @HiveField(3)
  late bool freeTrialUsed;

  @HiveField(4)
  late bool rewardedAdsCompleted;

  @HiveField(5)
  late String subscriptionStatus;

  @HiveField(6)
  late DateTime createdAt;

  @HiveField(7, defaultValue: '')
  late String name;

  UserModel({
    required this.id,
    required this.email,
    this.name = '',
    this.loginMethod = 'email',
    this.freeTrialUsed = false,
    this.rewardedAdsCompleted = false,
    this.subscriptionStatus = 'inactive',
    DateTime? createdAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now();
  }

  UserModel.empty() {
    id = '';
    email = '';
    name = '';
    loginMethod = 'email';
    freeTrialUsed = false;
    rewardedAdsCompleted = false;
    subscriptionStatus = 'inactive';
    createdAt = DateTime.now();
  }
}
