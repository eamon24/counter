import 'package:flutter/material.dart';
import 'swipe_screen.dart';

class DogProfileScreen extends StatefulWidget {
  static const routeName = '/dog-profile';

  const DogProfileScreen({super.key});

  @override
  State<DogProfileScreen> createState() => _DogProfileScreenState();
}

class _DogProfileScreenState extends State<DogProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  double _energy = 2;
  double _sociability = 2;
  String _temperament = 'Chill';

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your dog'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dog profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Dog name',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your dog\'s name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(
                  labelText: 'Breed (or mix)',
                ),
              ),
              const SizedBox(height: 16),

              const Text('Energy level'),
              Slider(
                value: _energy,
                min: 1,
                max: 3,
                divisions: 2,
                label: _energy == 1
                    ? 'Low'
                    : _energy == 2
                        ? 'Medium'
                        : 'High',
                onChanged: (v) {
                  setState(() {
                    _energy = v;
                  });
                },
              ),
              const SizedBox(height: 8),

              const Text('Sociability with other dogs'),
              Slider(
                value: _sociability,
                min: 1,
                max: 3,
                divisions: 2,
                label: _sociability == 1
                    ? 'Shy'
                    : _sociability == 2
                        ? 'Selective'
                        : 'Loves all dogs',
                onChanged: (v) {
                  setState(() {
                    _sociability = v;
                  });
                },
              ),
              const SizedBox(height: 16),

              const Text('Temperament'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  'Chill',
                  'Playful',
                  'Protective',
                  'Goofy',
                ].map((t) {
                  final selected = _temperament == t;
                  return ChoiceChip(
                    label: Text(t),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        _temperament = t;
                      });
                    },
                    selectedColor: color.withOpacity(0.15),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() != true) return;

                    Navigator.pushReplacementNamed(
                      context,
                      SwipeScreen.routeName,
                      arguments: {
                        'dogName': _nameController.text.trim(),
                      },
                    );
                  },
                  child: const Text('Save & start matching'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
