import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'global_loader.g.dart';

@riverpod
class GlobalLoader extends _$GlobalLoader {
  @override
  bool build() {
    return false;
  }

  void changebool(bool newBool) {
    state = newBool;
  }
}
