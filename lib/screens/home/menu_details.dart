import 'dart:convert';
import 'dart:math';

import 'package:eats/screens/home/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class MenuDetails extends StatefulWidget {
  const MenuDetails({Key? key, required this.title, required this.id}) : super(key: key);

  final String title;
  final int id;

  @override
  State<MenuDetails> createState() => _MenuDetailsState();
}

class _MenuDetailsState extends State<MenuDetails> {
  List<String> names = [];
  List<int> ids = [];
  List<String> prices = [];
  List<String> imagesSrc = [];
  Future<void> fetchData() async {
    final url = 'https://lansdalemeats.net/wp-json/wc/v3/products?category=${widget.id}';
    final username = 'ck_c4c5f249263c802f1d62ddcc0bdb6bfe8048d55a';
    final password = 'cs_50866ffb19492ce93c957dc6d202207f1ad2ee7e';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password')),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<String> tempNames = [];
      List<int> tempIds = [];
      List<String> tempPrices = [];
      List<String> tempImagesSrc = [];

      for (var item in data) {
        tempNames.add(item['name'] ?? '');
        print('nameeeeeeeeeeee');
        print(item['name']);
        tempIds.add(item['id'] ?? 0);
        tempPrices.add(item['price'] ?? '');
        if (item['images'] != null && item['images'].isNotEmpty) {
          String imageUrl = item['images'][0]['src'] ?? '';
          tempImagesSrc.add(imageUrl);
        } else {
          tempImagesSrc.add('');
        }
      }

      setState(() {
        names = tempNames;
        ids = tempIds;
        prices = tempPrices;
        imagesSrc = tempImagesSrc;
      });
    } else {
      // throw Exception('Failed to load data');
      print('eorrrrrrrrrrrrrrrrrrr');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }




  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
        child: names.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: min(names.length, prices.length),
          itemBuilder: (context, index) => DishCard(
            name: names[index],
            price: prices[index],
            imageSrc: imagesSrc[index],
            id: ids[index],
          ),
        ),
      ),
    );
  }
}
