import 'package:f_yc_utils/f_yc_utils.dart';

class LuckyTurntableState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;
}
