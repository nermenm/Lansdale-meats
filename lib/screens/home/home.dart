
import 'dart:convert';
import 'dart:math';
import 'package:eats/screens/home/widgets/dish_card.dart';
import 'package:eats/screens/home/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/helpers/constants.dart';
import '../../utils/theme/app_theme.dart';
import '../../utils/widgets/field.dart';
import 'menu.dart';
import 'menu_details.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  List<String> names = [];
  List<String> Product_ids = [];
  List<String> prices = [];
  List<int> ids = [];
  List<String> imagesSrc = [];

  Future<void> fetchData() async {
    final url = 'https://lansdalemeats.net/wp-json/wc/v3/products';
    final username = 'ck_c4c5f249263c802f1d62ddcc0bdb6bfe8048d55a';
    final password = 'cs_50866ffb19492ce93c957dc6d202207f1ad2ee7e';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization':
        'Basic ' + base64Encode(utf8.encode('$username:$password')),
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<String> tempPrices = [];
      List<String> tempImagesSrc = [];
      List<int> tempProduct_ids = [];

      List<String> tempNames = [];
      for (var item in data) {
        tempNames.add(item['name']);
tempProduct_ids.add(item['id']);

        tempPrices.add(item['price']);
        if (item['images'] != null && item['images'].isNotEmpty) {
          String imageUrl = item['images'][0]['src']; // Assuming you want the first image
          tempImagesSrc.add(imageUrl);
        } else {
          tempImagesSrc.add(''); // Set a default URL or handle the case where no image is available
        }
      }
      if (tempNames.length == tempPrices.length && tempPrices.length == tempImagesSrc.length) {
        setState(() {
ids= tempProduct_ids;
          names = tempNames;
          prices = tempPrices;
          imagesSrc = tempImagesSrc;
        });
      } else {
        print('Error: Lists have different lengths');
      }
    } else {
      // Handle error
      print('Failed to fetch data: ${response.statusCode}');
    }
  }
  http.Client httpClient = http.Client();
  @override
  void dispose() {
    searchController.dispose();
    httpClient.close();

    super.dispose();

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    Constants.menu;
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Lansdale ',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: AppTheme.handwrittenFont),
        ),
        // actions: [_search()],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
          child: SingleChildScrollView(
            child: 

             _body(context),
          ),
        ),
      ),
    );
  }



  Widget _body(BuildContext context) {
    return  new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        _title(context, 'Our Menu', const Menu()),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemCount: Constants.menu.length,
              itemBuilder: (context, index) => MenuItem(
                    text: Constants.menu[index],
                id: Constants.CatIds[index]
                  )),
        ),
        SizedBox(
          height: 16.h,
        ),
        // _title(context, 'All Dishes',
        //      MenuDetails(title: 'Popular dishes')),
        SizedBox(
          height: 16.h,
        ),
        names.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: min(names.length, prices.length),
          itemBuilder: (context, index) => DishCard(
            name: names[index] ?? 'Default Name',
            price: prices[index] ?? 'Default Price',
            imageSrc: imagesSrc[index] ?? 'Default ImageSrc', id: ids[index]??1,
          ),
        ),
      ],
    );
  }

  Widget _title(BuildContext context, String title, Widget screen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold),
        ),

      ],
    );
  }


}
