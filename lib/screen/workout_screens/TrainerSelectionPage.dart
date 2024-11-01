import 'package:captain11/screen/workout_screens/DaysSelectionPage.dart';
import 'package:flutter/material.dart';
import 'package:captain11/screen/workout_screens/ManagingSubscriber.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerSelectionPage extends StatefulWidget {
  @override
  _TrainerSelectionPageState createState() => _TrainerSelectionPageState();
}

class _TrainerSelectionPageState extends State<TrainerSelectionPage> {
  String? selectedTrainer;
  String? selectedPlan;

  final List<String> plans = ['أسبوعي', 'شهري', 'ثلاثة أشهر', 'ستة أشهر'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/ic_launcher_monochrome.png",
          height: 80,
          width: 80,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Container(
              padding: const EdgeInsets.all(16.0), // Padding داخلي للحاوية
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 121, 185, 238), Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubscriberListPage()),
                      );
                      if (result != null) {
                        setState(() {
                          selectedTrainer = result;
                        });
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.blue),
                      ),
                      color: Colors.blue[50],
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_search,
                              color: Colors.blue[800],
                            ),
                            const SizedBox(width: 10),
                            Text(
                              selectedTrainer == null
                                  ? 'اختر متدربًا'
                                  : 'المتدرب المختار: $selectedTrainer',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'اختر الخطة',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                    ),
                    items: plans.map((plan) {
                      return DropdownMenuItem(
                        value: plan,
                        child: Text(
                          plan,
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPlan = value;
                      });
                    },
                    value: selectedPlan,
                    icon:
                        Icon(Icons.arrow_drop_down_circle, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedTrainer != null && selectedPlan != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaysSelectionPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'يرجى اختيار المتدرب والخطة',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'الانتقال إلى الصفحة التالية',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFFE5B4)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              height: 150,
              width: 350,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.card_membership,
                      color: Colors.blue.shade700,
                      size: 36,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'الاشتراكات',
                      style: GoogleFonts.changa(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'اختر من خططنا للحصول على أفضل تجربة تدريبية.',
                      style: GoogleFonts.changa(
                        fontSize: 14,
                        color: Colors.blue.shade600,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SubscriberListPage extends StatefulWidget {
  @override
  _SubscriberListPageState createState() => _SubscriberListPageState();
}

class _SubscriberListPageState extends State<SubscriberListPage> {
  final List<String> subscribers = [
    'محمد',
    'أحمد',
    'منذر',
    'جعفر',
    'علي',
    'سعيد'
  ];
  late List<String> filteredSubscribers;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSubscribers = subscribers;
    searchController.addListener(_filterSubscribers);
  }

  void _filterSubscribers() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredSubscribers = subscribers
          .where((subscriber) => subscriber.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر المتدرب'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'بحث',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSubscribers.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: ListTile(
                      title: Text(
                        filteredSubscribers[index],
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                      trailing: Icon(Icons.arrow_forward, color: Colors.blue),
                      onTap: () {
                        Navigator.pop(context, filteredSubscribers[index]);
                      },
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