import 'package:flutter/material.dart';
import 'package:notifications/services/local_notifications.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // await LocalNotificationsService.start();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!LocalNotificationsService.notificationsEnabled)
                const Text(
                  "Siz xabarnomaga ruxsat bermadingiz shu sabab sizga xabarnomalar kelmaydi."
                  "\nBuni to'g'irlash uchun sozlamalarga borib to'girlang",
                ),
              TextButton.icon(
                  onPressed: () {
                    // LocalNotifications.showNotification();
                  },
                  icon: Icon(Icons.message),
                  label: Text("Oddiy Xabarnoma")),
              TextButton.icon(
                  onPressed: () {
                    // LocalNotificationsService.showScheduledNotification();
                  },
                  icon: Icon(Icons.message),
                  label: Text("Rejali Xabarnoma")),
              TextButton.icon(
                  onPressed: () {
                    // LocalNotificationsService.showPeriodicNotification();
                  },
                  icon: Icon(Icons.message),
                  label: Text("Davomiy Xabarnoma")),
            ],
          ),
        ),
      ),
    );
  }
}
