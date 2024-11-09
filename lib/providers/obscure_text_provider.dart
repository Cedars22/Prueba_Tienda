import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obscure_text_provider.g.dart';

@riverpod
class ObscureText extends _$ObscureText {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
