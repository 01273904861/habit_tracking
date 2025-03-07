import 'package:habbit_tracking_app/core/models/habit_model.dart';
import 'package:hive/hive.dart';
part 'day_model.g.dart';

@HiveType(typeId: 0)
class DayModel {
  @HiveField(0)
  final String date;
  @HiveField(1)
  List<HabitModel>? habitsList;
  @HiveField(2)
  double? percent;
  @HiveField(3)
  final String dayName;
  @HiveField(4)
  final String dayNum;
  @HiveField(5)
  int? counter;
  @HiveField(6)
  double? completness;
  DayModel({
    required this.dayName,
    required this.dayNum,
    required this.date,
    this.percent,
    this.habitsList,
    this.counter,
    this.completness,
  });

  // DayModel copyWith({
  //   String? date,
  //   List<HabitModel>? habitsList,
  //   double? completeness,
  // }) {
  //   return DayModel(
  //     date: date ?? this.date,
  //     habitsList: habitsList ?? this.habitsList,
  //     completeness: completeness ?? this.completeness,
  //   );
  // }
}
