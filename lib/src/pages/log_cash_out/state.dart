import 'package:f_yc_utils/f_yc_utils.dart';

class LogCashOutState {
  final _cashOutLogs = List.empty().obs;
  set cashOutLogs(value) => _cashOutLogs.value = value;
  get cashOutLogs => _cashOutLogs.value;
}
