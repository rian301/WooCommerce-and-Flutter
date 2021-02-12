import 'package:intl/intl.dart';

class Conversoes {
  NumberFormat formatarDinheiro() {
    NumberFormat converterMoeda = NumberFormat("#,##0.00", "pt_BR");
    return converterMoeda;
  }
}
