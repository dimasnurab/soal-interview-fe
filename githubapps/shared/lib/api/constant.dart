import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConstantApp {
  static const String baseUrl = 'https://api.github.com/';
  static String token = dotenv.env['TOKEN'] ?? '';
}
