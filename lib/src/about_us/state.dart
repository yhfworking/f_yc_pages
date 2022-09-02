import 'package:f_yc_utils/f_yc_utils.dart';

class AboutUsState {
  // version
  final _version = "".obs;
  set version(value) => _version.value = value;
  get version => _version.value;
}
