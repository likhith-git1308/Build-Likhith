import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class AppConfig {
  static late final String _environment;
  static late final String _apiBaseUrl;
  static late final int _apiTimeout;
  static late final String _razorpayKeyId;
  static late final bool _debug;

  static final logger = Logger();

  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
    
    _environment = dotenv.env['ENVIRONMENT'] ?? 'production';
    _apiBaseUrl = dotenv.env['API_BASE_URL'] ?? 'https://api.buildlikhith.com';
    _apiTimeout = int.tryParse(dotenv.env['API_TIMEOUT'] ?? '30000') ?? 30000;
    _razorpayKeyId = dotenv.env['RAZORPAY_KEY_ID'] ?? '';
    _debug = (dotenv.env['DEBUG'] ?? 'false').toLowerCase() == 'true';
  }

  static String get environment => _environment;
  static String get apiBaseUrl => _apiBaseUrl;
  static int get apiTimeout => _apiTimeout;
  static String get razorpayKeyId => _razorpayKeyId;
  static bool get debug => _debug;

  static bool get isProd => _environment == 'production';
  static bool get isDev => _environment == 'development';
}