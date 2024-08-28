import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Id $pokemonId', textAlign: TextAlign.center),
        ),
        body: Center(
          child: pokemonAsync.when(
            data: (data) => Text(data),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator()
            )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "next",
              key: const Key("next"),
              child: const Icon(Icons.exposure_plus_1),
              onPressed: () {
                if (pokemonId < 1) return;
                pokemonId++;
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            FloatingActionButton(
              heroTag: "previous",
              key: const Key("previous"),
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                pokemonId--;
                setState(() {});
              },
            ),
            const SizedBox(height: 40),
          ],
        ));
  }
}
