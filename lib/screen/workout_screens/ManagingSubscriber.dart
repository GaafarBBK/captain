import 'package:flutter/material.dart';
import 'package:captain11/screen/workout_screens/workout_selection.dart';

class MPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(''),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                child: ListTile(
                  leading:
                      Icon(Icons.fitness_center, size: 40, color: Colors.blue),
                  title: Text('تمارين'),
                  subtitle: Text('اختر التمارين المخصصة لك'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutSelectionPage()),
                      );
                    },
                    child: Text('الذهاب'),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 5,
                child: ListTile(
                  leading:
                      Icon(Icons.restaurant_menu, size: 40, color: Colors.green),
                  title: Text('جدول الغذاء'),
                  subtitle: Text('خطط وجباتك الغذائية'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NutritionPlanPage()),
                      );
                    },
                    child: Text('الذهاب'),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 5,
                child: ListTile(
                  leading:
                      Icon(Icons.subscriptions, size: 40, color: Colors.orange),
                  title: Text('الاشتراكات'),
                  subtitle: Text('إدارة اشتراكاتك'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscriptionsPage()),
                      );
                    },
                    child: Text('الذهاب'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    
  }


class NutritionPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('جدول الغذاء')),
      body: Center(child: Text('هنا يمكنك إدارة جدولك الغذائي.')),
    );
  }
}

class SubscriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاشتراكات')),
      body: Center(child: Text('هنا يمكنك إدارة اشتراكاتك.')),
    );
  }
}