
import 'package:eats/screens/cart/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utils/helpers/navigate.dart';
import '../../../utils/theme/app_theme.dart';
import '../../../utils/widgets/button.dart';
import '../../cart/cart_class.dart';
// import '../../cart/provider.dart';
import '../../cart/provider.dart';
import 'dish_details.dart';

class DishCard extends StatefulWidget {
   DishCard({super.key, this.isFav = false, required this.price, required this.name, required this.imageSrc, required this.id});
  List<Map<String, String>> objects = [];

  final bool isFav;
  final String? price;
  final String? imageSrc;
  final String? name;
int id;

  @override
  State<DishCard> createState() => _DishCardState();
}


class _DishCardState extends State<DishCard> {
  bool isFav = false;
  bool isAdded = false;
  int count = 0;
  int? groupValue;

  // List<CartItem> cartItems = [];

  @override
  void initState() {
    isFav = widget.isFav;
    super.initState();
  }
  // void addToCart(CartItem item) {
  //   Provider.of<CartProvider>(context, listen: false).addToCart(item);
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.secondaryColor.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigate.navigateTo(context, DishDetails(
                      price: widget.price,
                      imageSrc: widget.imageSrc,
                      name: widget.name,
                      index: null, id: widget.id,));
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    child: Image(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        fit: BoxFit.fill,
                        image:
                        NetworkImage(widget.imageSrc ?? 'Default img',)
                      // : AssetImage('assets/images/foodimg.png') as ImageProvider<Object>,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name ?? 'Default Name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  widget.price ?? 'Default price',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Button(
                  onPressed: () {
                    // Create a new CartItem
                    CartItem newItem = CartItem(
                      price: widget.price,
                      imageSrc: widget.imageSrc,
                      name: widget.name, id: widget.id,
                    );
                    // Use Provider to add the item to the cart
                    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);

                    // Print the length of the cartItems after adding the item
                    // print(Provider.of<CartProvider>(context, listen: false).cartItems.length);

                    // Navigate to the Cart screen (optional)
                    Navigate.navigateTo(context, Cart());
              },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

//   Future<dynamic> _showSheet(BuildContext context, bool isAdd) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             color: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Additions',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.2,
//                     child: ListView.builder(
//                         itemCount: 10,
//                         itemBuilder: (context, index) => AdditionRow(
//                           text: 'Add ${index + 1}',
//                         )),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   const TextField(
//                     maxLines: 4,
//                     maxLength: 40,
//                     decoration: InputDecoration(
//                       hintText: 'Item comments may result in extra charges',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   Button(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       if (isAdd) {
//                         setState(() {
//                           isAdded = true;
//                           count++;
//                         });
//                       } else {
//                         if (count - 1 == 0) {
//                           count--;
//                           isAdded = false;
//                         } else {
//                           count--;
//                         }
//                       }
//                     },
//                     child: const Text(
//                       'Confirm',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ));
//       },
//     );
//   }
// }
}