import 'package:captain11/screen/workout_screens/ManagingSubscriber.dart';
import 'package:flutter/material.dart';

class DaysSelectionPage extends StatefulWidget {
  @override
  _DaysSelectionPageState createState() => _DaysSelectionPageState();
}

class _DaysSelectionPageState extends State<DaysSelectionPage> {
  List<Map<String, dynamic>> days = [
    {'day': 'الأحد', 'isSelected': false},
    {'day': 'الإثنين', 'isSelected': false},
    {'day': 'الثلاثاء', 'isSelected': false},
    {'day': 'الأربعاء', 'isSelected': false},
    {'day': 'الخميس', 'isSelected': false},
    {'day': 'السبت', 'isSelected': false},
  ];

  List<String> selectedDays = [];

  void toggleSelection(int index, bool isSelected) {
    setState(() {
      days[index]['isSelected'] = isSelected;
    });
  }

  void navigateToSelectedDaysPage() {
    selectedDays = days
        .where((day) => day['isSelected'] == true)
        .map((day) => day['day'].toString())
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedDaysPage(selectedDays: selectedDays),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختر الأيام'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  bool isSelected = days[index]['isSelected'];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        days[index]['isSelected'] = !isSelected;
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: isSelected ? Colors.blue[100] : Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              days[index]['day'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Checkbox(
                              value: isSelected,
                              onChanged: (bool? value) {
                                toggleSelection(index, value!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: navigateToSelectedDaysPage,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
                shadowColor: Colors.blueAccent.withOpacity(0.3),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'التالي',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedDaysPage extends StatelessWidget {
  final List<String> selectedDays;

  SelectedDaysPage({required this.selectedDays});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأيام المختارة'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الأيام التي قمت باختيارها:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedDays.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MPage()));
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     content: Text('${selectedDays[index]} تم اختياره!'),
                      //     actions: [
                      //       TextButton(
                      //         onPressed: () => Navigator.pop(context),
                      //         child: const Text('إغلاق'),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          selectedDays[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}