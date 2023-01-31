import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  var total;
  MyGooglePay({super.key, this.total});

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  late final Future<PaymentConfiguration> _googlePayConfigFuture;
  @override
  void initState() {
    // TODO: implement initState
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('sample_payment_configuration.json');
    super.initState();
  }

  // ignore: prefer_final_fields

// In your Widget build() method

// In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server or PSP
    log(paymentResult);
  }

  @override
  Widget build(BuildContext context) {
    var _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: widget.total.toString(),
        status: PaymentItemStatus.final_price,
      )
    ];
    return Scaffold(
        body: Center(
      child: FutureBuilder<PaymentConfiguration>(
          future: _googlePayConfigFuture,
          builder: (context, snapshot) => snapshot.hasData
              ? GooglePayButton(
                  paymentConfiguration: snapshot.data!,
                  paymentItems: _paymentItems,
                  type: GooglePayButtonType.buy,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: onGooglePayResult,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox.shrink()),
    ));
  }
}
