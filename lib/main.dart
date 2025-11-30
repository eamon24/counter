import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/dog_profile_screen.dart';
import 'screens/swipe_screen.dart';
import 'screens/matches_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const DogSinglesApp());
}

class DogSinglesApp extends StatelessWidget {
  const DogSinglesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFE74C3C), // soft red
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFBF7), // warm cream
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 15),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );

    return MaterialApp(
      title: 'Dog.Singles',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        DogProfileScreen.routeName: (_) => const DogProfileScreen(),
        SwipeScreen.routeName: (_) => const SwipeScreen(),
        MatchesScreen.routeName: (_) => const MatchesScreen(),
        ChatScreen.routeName: (_) => const ChatScreen(),
      },
    );
  }
}
