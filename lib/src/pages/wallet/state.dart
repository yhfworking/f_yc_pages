import 'package:f_yc_utils/f_yc_utils.dart';

class WalletState {
  final _balance = 0.obs;
  set balance(value) => _balance.value = value;
  get balance => _balance.value;

  final _money = "0.00".obs;
  set money(value) => _money.value = value;
  get money => _money.value;
}
