import 'package:easy_localization/easy_localization.dart';

double formatNum(num? number, int postion) {
  if (number is int) {
    number = number.toDouble();
  }
  if ((number.toString().length - number.toString().lastIndexOf(".") - 1) < postion) {
    return double.parse(
        number!.toStringAsFixed(postion).substring(0, number.toString().lastIndexOf(".") + postion + 1));
  } else {
    return double.parse(number.toString().substring(0, number.toString().lastIndexOf(".") + postion + 1));
  }
}

//1,230.00
final currencyFormat = NumberFormat.currency(customPattern: "#,##0.00");

//1,230
final currencyIntFormat = NumberFormat("#,##0");

//1.23K
final thousandFormat = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '',
);
