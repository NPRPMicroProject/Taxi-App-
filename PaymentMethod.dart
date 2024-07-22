import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Methods"),
        backgroundColor: Colors.amber[600],
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: content(),
      floatingActionButton: GestureDetector(
        onTap: () {
          if (selectedPaymentMethod != null) {
            // Proceed with the selected payment method
            print("Selected Payment Method: $selectedPaymentMethod");
            // Navigate to next screen
            Navigator.of(context).pushNamed('/summary');
          } else {
            // Show error message or prompt user to select a payment method
            print("Please select a payment method");
          }
        },
        child: Container(
          height: 45,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.amber[600],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          paymentMethod("Master card", "assets/mastercard.png"),
          SizedBox(
            height: 20,
          ),
          paymentMethod("paypal", "assets/paypal.png"),
          SizedBox(
            height: 20,
          ),
          paymentMethod("visa", "assets/visa.png"),
        ],
      ),
    );
  }

  Widget paymentMethod(String title, String iconPath) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedPaymentMethod = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              selectedPaymentMethod == title ? Colors.amber[200] : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(title),
          leading: Container(
            child: Image.asset(iconPath),
            height: 50,
            width: 50,
          ),
          trailing: Radio<String>(
            value: title,
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
