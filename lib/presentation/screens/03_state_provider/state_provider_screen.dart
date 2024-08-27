import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String name = ref.watch(usernameProvider);
    final String counter = ref.watch(counterProvider).toString();
    final bool darkmode = ref.watch(darkModeProvider);

    print("darkmnode $darkmode");
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            icon: darkmode
                ? const Icon(Icons.light_mode_outlined, size: 100)
                : const Icon(Icons.dark_mode_outlined, size: 100),
            onPressed: () {
              ref.read(darkModeProvider.notifier).changeMode();
            },
          ),
          Text(name, style: const TextStyle(fontSize: 25)),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text(counter, style: const TextStyle(fontSize: 100)),
            onPressed: () {
              ref.read(counterProvider.notifier).increaseByOne();
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref
              .read(usernameProvider.notifier)
              .changeName(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}
