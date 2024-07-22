import 'package:flutter/material.dart';
import 'package:real_taxi/booking.dart';
import 'package:real_taxi/call.dart';
import 'package:real_taxi/home.dart';
import 'package:real_taxi/paymentMethod.dart';
import 'package:real_taxi/summary.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': ((context) => Home()),
          '/booking': ((context) => Booking()),
          "/paymentMethod": ((context) => PaymentMethod()),
          "/summary": ((context) => Summary()),
          "/call": ((context) => Call()),
        },
      ),
    );
