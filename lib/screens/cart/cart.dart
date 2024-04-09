
import 'package:eats/screens/cart/checkout.dart';
import 'package:eats/screens/cart/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/helpers/navigate.dart';
import '../../utils/widgets/button.dart';
import '../../utils/widgets/counter.dart';
import 'cart_class.dart';

class Cart extends StatefulWidget {
   const Cart({super.key,});
   @override
  State<Cart> createState() => _CartState();
}
class _CartState extends State<Cart> {
  @override

  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child:Consumer<CartProvider>(
    builder: (context, CartProvider, child) {
    List<CartItem> cartItems = CartProvider.cartItems;
    // List<Map<String, dynamic>> lineItems = [];
    return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount:CartProvider.cartItems.length,
                        itemBuilder: (context, index) {
    CartItem currentItem = cartItems[index];
                          return  CartProvider.cartItems.isEmpty
                              ? const Center(child: Text("You cart is empty"))
                              :Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 80.h,
                                  width: 120.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                        image:  NetworkImage(
                                          currentItem.imageSrc ?? 'Default Name',)),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentItem.name ?? 'Default Name',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      currentItem.price ?? 'Default Name',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Counter(
                                                  count: 1,
                                                  // onPressed: (bool isAdd) {}
    onPressed: (bool isAdd) {
    setState(() {
    if (isAdd) {
    currentItem.quantity++; // Increment quantity
    } else {
    if (currentItem.quantity > 1) {
    currentItem.quantity--; // Decrement quantity if greater than 1
    }
    }
    });}


                                              )),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            minWidth: 20.w,
                                            color: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    CartProvider.deleteFromCart(index);},

                                                    // Provider.of<CartProvider>(context, listen: false).deleteFromCart(currentItem) ;},
                                                  icon: Icon(
                                                    CupertinoIcons.delete,
                                                    size: 12.h,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                    child: Button(
                      height: 40.h,
                      onPressed: () {
                        print('here is chechout presed');
                        List<Map<String, dynamic>> lineItems = [];
                        for (var item in cartItems) {

                            print(item.quantity);
                            lineItems.add({
                              "product_id": item.id,
                              "quantity": item.quantity,
                            });
                        }


                        // Navigate to checkout with line_items
                        Navigate.navigateTo(
                          context,
                          Checkout(lineItems: lineItems),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            'Checkout'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 20.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                              child: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );}
      ),
    ));
  }
}



