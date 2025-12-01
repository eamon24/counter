import 'package:flutter/material.dart';
import 'dog_profile_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.pets,
              size: 80,
              color: color,
            ),
            const SizedBox(height: 16),
            const Text(
              'Let your dog pick your match.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Create your dog\'s profile so we can find pups they will love '
              'meeting in your city.',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DogProfileScreen.routeName,
                  );
                },
                child: const Text('Create dog profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
