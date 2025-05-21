import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 1)
class HabitModel {
  @HiveField(0)
   int counter;
  @HiveField(1)
   String title;
  @HiveField(2)
   String image;
  @HiveField(3)
   double complements;

  HabitModel({
    this.complements = 0,
    required this.counter,
    required this.title,
    required this.image,
  });
}