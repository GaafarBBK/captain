import 'package:flutter/material.dart';
import 'package:captain11/screen/Onboarding/gender_toggle_switch.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              buildPage(
                title: "تدرب في أي وقت ومن أي مكان",
                body:
                    "حقق أهدافك البدنية مع برامج تدريب متاحة في أي وقت وأينما كنت. ابدأ رحلة اللياقة البدنية الخاصة بك الآن.",
                image: 'assets/login.png',
              ),
              buildPage(
                title: "برامج تدريب مخصصة",
                body:
                    "اختر من بين مجموعة من البرامج المصممة خصيصًا لتناسب مستوى لياقتك وأهدافك الشخصية.",
                image: 'assets/login.png',
              ),
              buildPage(
                title: "ابدأ التغيير اليوم",
                body:
                    "انضم إلى مجتمعنا الرياضي الآن وابدأ تحسين قوتك ولياقتك مع أفضل المدربين والمحتوى الحصري.",
                image: 'assets/login.png',
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 20.0 : 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => goToHome(context),
                  child: Text("تخطي"),
                ),
                TextButton(
                  onPressed: _currentIndex == 2
                      ? () => goToHome(context)
                      : () => _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                  child: Text(_currentIndex == 2 ? "تم" : "التالي"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(
      {required String title, required String body, required String image}) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Image.asset(image, width: 300),
          const SizedBox(height: 80),
          Text(
            title,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Text(
            body,
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => GenderToggleSwitch()),
    );
  }
}