import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  static final _razorpay = Razorpay();

  static void initialize() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  static void processPayment({
    required String orderId,
    required double amount,
    required String description,
    required String email,
    required String phone,
  }) {
    final options = {
      'key': 'YOUR_RAZORPAY_KEY',
      'order_id': orderId,
      'amount': (amount * 100).toInt(),
      'name': 'Build Likhith',
      'description': description,
      'prefill': {
        'contact': phone,
        'email': email,
      },
      'external': {
        'wallets': ['paytm']
      },
    };
    _razorpay.open(options);
  }

  static void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
  }

  static void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.message}');
  }

  static void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
  }

  static void dispose() {
    _razorpay.clear();
  }
}