import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyRazorPay extends StatefulWidget {
  const MyRazorPay({super.key});

  @override
  State<MyRazorPay> createState() => _MyRazorPayState();
}

class _MyRazorPayState extends State<MyRazorPay> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Congratulation! Payment Successful: ${response.paymentId}")));
    // Handle the success event here
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Payment Error: ${response.code} - ${response.message}")));

    // Handle the error event here
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("External Wallet: ${response.walletName}")));

    // Handle the external wallet event here
  }

  void _startPayment() {
    var options = {
      'key': 'rzp_test_8q6i0nQ3mc239Y',
      'amount': 200 * 100,
      'name': 'Flipkart',
      'description': 'Test Payment',
      'timeout': 60,
      'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(400, 70), backgroundColor: Colors.grey[800]),
      onPressed: _startPayment,
      child: Text(
        "Buy Now",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}



// rzp_test_8q6i0nQ3mc239Y
// HidE57Xy6X308Cmd0hk2GiJR