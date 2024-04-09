import 'package:eats/screens/home/home.dart';
import 'package:eats/utils/helpers/navigate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Checkout extends StatefulWidget {
  final List<Map<String, dynamic>> lineItems;

  Checkout({Key? key, required this.lineItems}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _submitOrder() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var url = 'https://lansdalemeats.net/wp-json/wc/v3/orders';
      var body = jsonEncode({
        "payment_method": "bacs",
        "payment_method_title": "Cash on Pickup",
        "set_paid": true,
        "billing": {
          "first_name": firstName,
          "last_name": lastName,
          "address_1": address,
          "city": city,
          "postcode": postcode,
          "country": country,
          "email": email,
          "phone": phone
        },
        "shipping": {
          "first_name": firstName,
          "last_name": lastName,
          "address_1": address,
          "city": city,
          "postcode": postcode,
          "country": country
        },
        "line_items": widget.lineItems,
        "meta_data": [
          {
            "id": 67315,
            "key": "Pickup Date",
            "value": pickupDate,
            "display_key": "Pickup Date",
            "display_value": pickupDate
          },
          {
            "id": 67298,
            "key": "Pickup Time",
            "value": pickupTime,
            "display_key": "Pickup Time",
            "display_value": pickupTime
          }
        ],
        "customer_note": comment
      });
      final username = 'ck_c4c5f249263c802f1d62ddcc0bdb6bfe8048d55a';
      final password = 'cs_50866ffb19492ce93c957dc6d202207f1ad2ee7e';
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization':
          'Basic ' + base64Encode(utf8.encode('$username:$password')),
          'Content-Type': 'application/json', // Specify content type
        },
        body: body,
      );

      if (response.statusCode >= 200 && response.statusCode < 400) {
        print('Order placed successfully!');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              content: Text(
                "Your order has been placed successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigate.navigateTo(
                      context,
                      Home(),
                    );
                  },
                  child: Text("Continue Shopping"),
                ),
              ],
            );
          },
        );
      } else {
        print("Failed to place order. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    }
  }

  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? country;
  String? postcode;
  String? email;
  String? phone;
  String? pickupDate;
  String? pickupTime;
  String? comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "First Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    firstName = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    lastName = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "City",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    city = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Country",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    country = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Postcode",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your postcode';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    postcode = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Email Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phone = value;
                  },
                ),
                TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: pickupDate),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Pickup Date",
                  ),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      setState(() {
                        pickupDate =
                        selectedDate.toIso8601String().split('T')[0];
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pickup date';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    pickupDate = value;
                  },
                ),
                TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: pickupTime),
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Pickup Time",
                  ),
                  onTap: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (selectedTime != null) {
                      setState(() {
                        pickupTime = selectedTime.format(context);
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pickup time';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    pickupTime = value;
                  },
                ),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Comment",
                  ),
                  onSaved: (value) {
                    comment = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitOrder,
                  child: Text('Place Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
