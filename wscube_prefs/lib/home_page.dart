import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Color? color;
  int? appStartCount;
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    getAppStartCount();
  }

  Future<void> getAppStartCount() async {
    final SharedPreferences prefs = await _prefs;
    int? count = prefs.getInt('appStartCount');
    print(count);

    if (count == null) {
      await prefs.setInt('appStartCount', 0);
      count = 0;
    } else {
      count += 1;
      await prefs.setInt('appStartCount', count);
    }

    Color bgColor;
    if (count % 3 == 0 && count % 5 == 0) {
      bgColor = Colors.amberAccent;
    } else if (count % 3 == 0) {
      bgColor = Colors.blueAccent;
    } else if (count % 5 == 0) {
      bgColor = Colors.redAccent;
    } else {
      bgColor = Colors.orangeAccent;
    }

    setState(() {
      appStartCount = count;
      color = bgColor;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            )
          : Column(
              children: [
                AppBar(
                  title: const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: color,
                  centerTitle: true,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 200,
                      height: 300,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "App Started",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "App opened $appStartCount times",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
