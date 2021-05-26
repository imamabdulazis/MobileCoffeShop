import 'package:intl/intl.dart';

formatRupiah(double money) {
  final convertedMoney =
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ')
          .format(money);
  return convertedMoney.toString();
}
