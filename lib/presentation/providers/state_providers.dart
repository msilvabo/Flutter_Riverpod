import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'state_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 5;

  void increaseByOne() {
    state++;
  }
}

//darkmode
@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() {
    return false;
  }

  void changeMode() {
    state = state == true ? false : true;
  }
}

// name
@Riverpod(keepAlive: true)
class Username extends _$Username {
  @override
  String build() => 'Moises Silva';

  void changeName(String name) {
    state = name;
  }

  void reset() {
    state = 'Moises Silva';
  }
}
