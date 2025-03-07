import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:habbit_tracking_app/core/models/habit_model.dart';
import 'package:habbit_tracking_app/core/theming/app_constants.dart';
import 'package:hive/hive.dart';

part 'habits_states.dart';

class HabitsCubit extends Cubit<HabitsState> {
  HabitsCubit() : super(AddHabitInitial()) {
    habitBox = Hive.box<HabitModel>(AppConstants.habitBox);
    getHabitsList(); // ✅ تحميل البيانات عند تشغيل الكابت
  }

  late String image;
  late TextEditingController title = TextEditingController();
  late TextEditingController counterControler = TextEditingController();
  double complements = 0;
  List<HabitModel> habits = [];
  int counter = 0;
  late Box<HabitModel> habitBox;

  /// ✅ إضافة عادة جديدة إلى Hive مع تحديث الحالة
  void addHabitMethod() {
    counter = int.tryParse(counterControler.text) ?? 0;

    HabitModel newHabit = HabitModel(
      counter: counter,
      title: title.text,
      image: image,
      complements: complements,
    );

    habitBox.add(newHabit); // حفظ في Hive
    getHabitsList(); // إعادة تحميل القائمة

    // ✅ مسح المدخلات بعد الإضافة
    title.clear();
    image = '';
    counterControler.clear();
  }

  /// ✅ تحميل القائمة من Hive بشكل صحيح
  void getHabitsList() {
    habits = habitBox.values.cast<HabitModel>().toList(); // ✅ التحويل الصحيح

    if (habits.isNotEmpty) {
      emit(HabitsLoaded(habits: List.from(habits))); // ✅ إعادة بناء الواجهة
    } else {
      emit(HabitsListIsEmpty());
    }
  }

  /// ✅ حذف جميع العادات مع تحديث الواجهة
  void deleteAllHabits() {
    habitBox.clear();
    emit(HabitsListIsEmpty()); // ✅ إعادة تحميل القائمة بعد الحذف
  }

  /// ✅ تحديث العداد مع حفظ التحديث في Hive
  void incrementCounter(int index) {
    HabitModel habit = habits[index];

    if (habit.complements < habit.counter) {
      habit.complements++;
      habitBox.putAt(index, habit); // ✅ تحديث العنصر في Hive
      getHabitsList(); // ✅ إعادة تحميل القائمة بعد التحديث
    }
  }

  void deleteHabit(int index) {
    habitBox.deleteAt(index); // ✅ حذف العنصر من Hive
    getHabitsList(); // ✅ إعادة تحميل القائمة بعد الحذف
  }
}
