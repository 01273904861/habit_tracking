import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habbit_tracking_app/core/constants/assets.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/models/habit_model.dart';
import 'package:habbit_tracking_app/core/theming/app_constants.dart';
import 'package:hive/hive.dart';

part 'day_state.dart';

class DayCubit extends Cubit<DayState> {
  DayCubit() : super(DayInitial()) {
    dayBox = Hive.box<DayModel>(AppConstants.dayBox);
    today = AppFunctions.formateFullDate(DateTime.now());
    dayNum = AppFunctions.formatDateNum(DateTime.now());
    dayName = AppFunctions.formatDateName(DateTime.now());
    addDayMethod();
  }

  late Box<DayModel> dayBox;
  List<DayModel> daysList = [];
  late String today;
  late String dayNum;
  late String dayName;
  late List<HabitModel> habitsList = [];
  final GlobalKey<AnimatedListState> animatedKey =
      GlobalKey<AnimatedListState>();

  String? image;
  late TextEditingController title = TextEditingController(text: '');
  late TextEditingController counterControler =
      TextEditingController(text: '0');
  double complements = 0;

  int counter = 0;

  void addDayMethod() {
    daysList = dayBox.values.toList();

    if (daysList.isNullOrEmpty() || daysList.last.date != today) {
      DayModel dayModel = DayModel(
        date: today,
        habitsList: [],
        percent: 0.0,
        dayName: dayName,
        dayNum: dayNum,
        completness: 0,
        counter: 0,
      );
      daysList.add(dayModel);
      dayBox.put(dayModel.date, dayModel);
    }
    // scrollController.jumpTo(scrollController.position.minScrollExtent);
    // daysList = dayBox.values.toList();
    emit(DayListLoaded(daysList: daysList));
  }

  void addNewHabit() {
    counter = int.tryParse(counterControler.text) ?? 0;

    HabitModel newHabit = HabitModel(
      counter: counter,
      title: title.text,
      image: image ?? Assets.imagesAtivityDefault,
      complements: complements,
    );
    DayModel dayModel = dayBox.values.toList().last; //last day in the list
    dayModel.habitsList!.add(newHabit); //add habit on it

    dayBox.put(dayModel.date, dayModel);
    animatedKey.currentState?.insertItem(dayModel.habitsList!.length - 1);//animated key 
    title.clear();
    image = '';
    counterControler.clear();
    calcuclateDayCompleteness();
  }

  void getAllDays() {
    daysList = dayBox.values.toList();

    if (daysList.isNullOrEmpty()) {
      DayModel dayModel = DayModel(
        date: today,
        habitsList: [],
        percent: 0.0,
        dayName: dayName,
        dayNum: dayNum,
        completness: 0,
        counter: 0,
      );
      dayBox.put(dayModel.date, dayModel);
    }
    emit(DayListLoaded(daysList: dayBox.values.toList()));
  }

  void deleteAllHabitsOfADay(DayModel dayModel) {
    dayModel.habitsList = [];

    dayBox.put(dayModel.date, dayModel);

    getAllDays();
  }

  void incrementCounter({required int habitIndex, required DayModel dayModel}) {
    if (dayModel.habitsList![habitIndex].complements <
        dayModel.habitsList![habitIndex].counter) {
      dayModel.habitsList![habitIndex].complements++;
      dayBox.put(dayModel.date, dayModel);

      calcuclateDayCompleteness();
    }
  }

  void deleteHabit({required int habitIndex, required DayModel dayModel ,required Widget buildHabit}) {
    // Check if habitsList is not null
    if (!dayModel.habitsList.isNullOrEmpty()) {
      // Check if habitIndex is within bounds
      if (habitIndex >= 0 && habitIndex < dayModel.habitsList!.length) {
        // Remove the habit at the specified index
        dayModel.habitsList!.removeAt(habitIndex);
        
    animatedKey.currentState?.removeItem(habitIndex, (context , animation){
      return buildHabit;
    });
    dayBox.put(dayModel.date, dayModel);
           
        // Emit the new state with the updated list
        calcuclateDayCompleteness();
      } else {
        // Handle the case where habitIndex is out of bounds
        throw ArgumentError('habitIndex is out of bounds');
      }
    } else {
      // Handle the case where habitsList is null
      throw ArgumentError('habitsList is null');
    }
  }

  void calcuclateDayCompleteness() {
    DayModel dayModel = dayBox.values.last;//calculate day completeness for last day only
    double completenessSum = 0;
    int counterSum = 0;
    double percent = 0;
    dayModel.habitsList?.forEach((habit) {
      completenessSum += habit.complements;
      counterSum += habit.counter;
    });
    try {
      percent = completenessSum / counterSum;
    } catch (e) {
      percent = 0;
    }
    dayModel.percent = percent;
    dayModel.counter = counterSum;
    dayModel.completness = completenessSum;
    dayBox.put(dayModel.date, dayModel);

    getAllDays();
  }

  void delteDay(DayModel dayModel) {
    dayBox.delete(dayModel.date);
    getAllDays();
  }

  void deleteAllDays() {
    dayBox.clear();
    getAllDays();
  }

  void editHabit({required DayModel dayModel, required int habitIndex}) {
    HabitModel habit = dayModel.habitsList![habitIndex];
    int counter2 = int.tryParse(counterControler.text) ?? 0;
    if (counter2 < dayModel.completness!) {
      dayModel.completness = counter2.toDouble();
    }
    dayModel.counter = counter2;
    dayModel.habitsList![habitIndex].title =
        title.text.isNullOrEmpty() ? habit.title : title.text;
    dayModel.habitsList![habitIndex].image =
        image.isNullOrEmpty() ? habit.image : image!;

    dayBox.put(dayModel.date, dayModel);
    title.clear();
    image = '';
    counterControler.clear();
    calcuclateDayCompleteness();
  }
}
