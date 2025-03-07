part of 'day_cubit.dart';

@immutable
abstract class DayState {}

final class DayInitial extends DayState {}
final class DayListLoaded extends DayState {
final  List<DayModel>daysList;

  DayListLoaded({required this.daysList});
}
final class NoDays extends DayState {}
