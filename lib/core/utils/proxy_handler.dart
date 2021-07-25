import 'package:parts_tracker/global.dart';

class ProxyHandler {
  static String convertURLForImage(String url) {
    String trimmed = url.substring(22, url.length);
    String localImageURL = '${URLConstants.ipv4URL}/$trimmed';
    return localImageURL;
  }
}
