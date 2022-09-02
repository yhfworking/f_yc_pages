import 'package:f_yc_utils/f_yc_utils.dart';

class LogWalletState {
  final _walletLogs = List.empty().obs;
  set walletLogs(value) => _walletLogs.value = value;
  // ignore: invalid_use_of_protected_member
  get walletLogs => _walletLogs.value;
}
