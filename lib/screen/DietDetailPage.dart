import 'package:flutter/material.dart';

class DetailsDiet extends StatefulWidget {
  final Map<String, dynamic> Diet;
  final Function(bool isChecked) onToggleCheck;

  DetailsDiet({required this.Diet, required this.onToggleCheck});

  @override
  _DetailsDietState createState() => _DetailsDietState();
}

class _DetailsDietState extends State<DetailsDiet> {
  bool? isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.Diet['isChecked'];
  }

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked!;
      widget.onToggleCheck(isChecked!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.Diet['name']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue)),
              child: Image.asset(
                "assets/login.png",
                width: 400,
                height: 400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.Diet['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.Diet['sets'],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'التاريخ: ${widget.Diet['date']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                const SizedBox(width: 70),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF00A7E1),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      toggleCheck();
                    },
                    child: const Text(
                      'تم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}