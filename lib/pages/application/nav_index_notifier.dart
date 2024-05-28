import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'nav_index_notifier.g.dart';

@riverpod
class NavIndexNotifier extends _$NavIndexNotifier {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
