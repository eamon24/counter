import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MatchesScreen extends StatelessWidget {
  static const routeName = '/matches';

  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = ModalRoute.of(context)?.settings.arguments
            as List<Map<String, String>>? ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: matches.isEmpty
          ? const Center(child: Text('No matches yet. Keep swiping!'))
          : ListView.separated(
              itemCount: matches.length,
              padding: const EdgeInsets.all(12),
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final m = matches[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.pets),
                  ),
                  title: Text(m['name'] ?? 'Dog'),
                  subtitle: Text(m['breed'] ?? ''),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ChatScreen.routeName,
                      arguments: m,
                    );
                  },
                );
              },
            ),
    );
  }
}
