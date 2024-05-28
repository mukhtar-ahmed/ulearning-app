import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifire.g.dart';

@riverpod
class IndexNotifire extends _$IndexNotifire {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
  }
}
