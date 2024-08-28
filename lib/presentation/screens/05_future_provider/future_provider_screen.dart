import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
          child: pokemonName.when(
              data: (data) => Text(data),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => CircularProgressIndicator())),
      floatingActionButton: 
        Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
              FloatingActionButton(
                heroTag: "next",
                key: const Key("next"),
                child: const Icon(Icons.refresh),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).nextPokemon();
                },
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                heroTag: "previous",
                key: const Key("previous"),
                child: const Icon(Icons.back_hand_sharp),
                onPressed: () {
                  ref.read(pokemonIdProvider.notifier).previusPokemon();
                },
              ),
              const SizedBox(height: 40),
          ],
      )
    );
  }
}
