import 'package:flutter/material.dart';
import 'matches_screen.dart';

class SwipeScreen extends StatefulWidget {
  static const routeName = '/swipe';

  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _mockDogs = [
    {
      'name': 'Luna',
      'breed': 'Golden Retriever',
      'compatibility': 'High',
      'city': 'Toronto',
    },
    {
      'name': 'Max',
      'breed': 'French Bulldog',
      'compatibility': 'Medium',
      'city': 'Toronto',
    },
    {
      'name': 'Bella',
      'breed': 'Border Collie',
      'compatibility': 'High',
      'city': 'Toronto',
    },
  ];

  final List<Map<String, String>> _matches = [];

  void _swipeLeft() {
    setState(() {
      if (_currentIndex < _mockDogs.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = _mockDogs.length; // no more cards
      }
    });
  }

  void _swipeRight() {
    if (_currentIndex < _mockDogs.length) {
      _matches.add(_mockDogs[_currentIndex]);
    }
    setState(() {
      if (_currentIndex < _mockDogs.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = _mockDogs.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final myDogName = args != null ? args['dogName'] as String? : null;
    final color = Theme.of(context).colorScheme.primary;

    final hasCards = _currentIndex < _mockDogs.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(myDogName != null ? 'Matches for $myDogName' : 'Matches'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
                MatchesScreen.routeName,
                arguments: _matches,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: hasCards
              ? _buildCard(color)
              : const Text(
                  'No more nearby dogs right now.\nCheck back later!',
                  textAlign: TextAlign.center,
                ),
        ),
      ),
      bottomNavigationBar: hasCards
          ? Padding(
              padding: const EdgeInsets.fromLTRB(40, 8, 40, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: 'nope',
                    onPressed: _swipeLeft,
                    child: const Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    heroTag: 'like',
                    onPressed: _swipeRight,
                    child: const Icon(Icons.favorite),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildCard(Color color) {
    final dog = _mockDogs[_currentIndex];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(
                  Icons.pets,
                  size: 60,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${dog['name']} • ${dog['breed']}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            dog['city'] ?? '',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Compatibility: ${dog['compatibility']}',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
