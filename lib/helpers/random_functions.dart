

import 'dart:ffi';

int calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;

  if (currentDate.month < birthDate.month || 
      (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}


int calculateCaloriesBurned(int steps, int weight) {
  return (steps * 0.044 * (weight / 70)).toInt();
}
