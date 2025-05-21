part of 'habits_cubit.dart';

 class HabitsState {}

final class AddHabitInitial extends HabitsState {}

final class AddHabitSuccesfully extends HabitsState {}

final class AddHabitFailure extends HabitsState {}

final class HabitsLoaded extends HabitsState {
  final List<HabitModel> habits;

  HabitsLoaded({required this.habits});
}

final class HabitsListIsEmpty extends HabitsState {}

final class IncrementComplements extends HabitsState{
  final int counter;

  IncrementComplements({required this.counter});
  
}