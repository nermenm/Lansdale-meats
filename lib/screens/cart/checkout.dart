import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Checkout extends StatefulWidget {
  final List<Map<String, dynamic>> lineItems;

  Checkout({super.key, required this.lineItems});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postcodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pickupDateController = TextEditingController();
  TextEditingController pickupTimeController = TextEditingController();
  TextEditingController CountryController = TextEditingController();

  void _submitOrder() async {
    var url = 'https://lansdalemeats.net/wp-json/wc/v3/orders';
    var body = jsonEncode({
      "payment_method": "bacs",
      "payment_method_title": "Cash on Pickup",
      "set_paid": true,
      "billing": {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "address_1": addressController.text,
        "city": cityController.text,
        "postcode": postcodeController.text,
        "country": "US",
        "email": emailController.text,
        "phone": phoneController.text
      },
      "shipping": {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "address_1": addressController.text,
        "city": cityController.text,
        "postcode": postcodeController.text,
        "country": CountryController.text
      },
      "line_items": widget.lineItems,
      "meta_data": [
        {
          "id": 67315,
          "key": "Pickup Date",
          "value": pickupDateController.text,
          "display_key": "Pickup Date",
          "display_value": pickupDateController.text
        },
        {
          "id": 67298,
          "key": "Pickup Time",
          "value": pickupTimeController.text,
          "display_key": "Pickup Time",
          "display_value": pickupTimeController.text
        }
      ]
    });
    final username = 'ck_c4c5f249263c802f1d62ddcc0bdb6bfe8048d55a';
    final password = 'cs_50866ffb19492ce93c957dc6d202207f1ad2ee7e';
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization':
        'Basic ' + base64Encode(utf8.encode('$username:$password')),
      },
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print(body);
      print(response.statusCode);
      // Order successful
      print("Order placed successfully!");
      // You can navigate to a success page or show a dialog here
    } else {
      print("bodyyyyyyyyyyyyyyyyyyyyy hereeeee");

      print(body);
      // Order failed
      print("Failed to place order. Status code: ${response.statusCode}");
      print("Failed to place order. Status code: ${response}");
      // You can show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              style: const TextStyle(color: Colors.black),
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name',),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: CountryController,
              decoration: const InputDecoration(labelText: 'Country'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: postcodeController,
              decoration: const InputDecoration(labelText: 'Postcode'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: pickupDateController,
              decoration: const InputDecoration(labelText: 'Pickup Date'),
            ),
            TextField(    style: const TextStyle(color: Colors.black),
              controller: pickupTimeController,
              decoration: const InputDecoration(labelText: 'Pickup Time'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitOrder,
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Checkout(),
//   ));
// }
