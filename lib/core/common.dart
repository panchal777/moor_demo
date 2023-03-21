import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Common {
  static void showToast({required String msg, int timeInSec = 1}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: timeInSec,
    );
  }

  static getDateFormatToString(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static bool isPrime(N) {
    for (var i = 2; i <= N / i; ++i) {
      if (N % i == 0) {
        return false;
      }
    }
    return true;
  }
}
