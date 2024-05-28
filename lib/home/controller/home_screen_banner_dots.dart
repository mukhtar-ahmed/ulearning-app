import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen_banner_dots.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int index) {
    state = index;
    print(index);
  }
}
