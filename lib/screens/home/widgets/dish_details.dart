import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/helpers/navigate.dart';
import '../../../utils/widgets/button.dart';
import '../../cart/cart.dart';
import '../../cart/cart_class.dart';
import '../../cart/provider.dart';

class DishDetails extends StatefulWidget {
  const DishDetails(
      {super.key,
      required this.price,
      required this.imageSrc,
        required this.name,
        required this.id,
      required this.index});

  final String? price;
  final String? imageSrc;
  final String? name;
  final Int? index;
  final int id;

  State<DishDetails> createState() => _DishDetailsState();
}

class _DishDetailsState extends State<DishDetails> {
  int count = 1;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image(
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.imageSrc ?? 'Default img',
                      )),
                ),
                Positioned(
                    top: 40,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                          child: Icon(CupertinoIcons.chevron_back),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      widget.price!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    const TextField(
                      maxLines: 4,
                      maxLength: 40,
                      decoration: InputDecoration(
                        hintText: 'Item comments may result in extra charges',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                // Expanded(
                //     child:
                //     Counter(
                //         count: count,
                //         onPressed: (bool isAdd) {
                //           if (isAdd) {
                //             count++;
                //           } else {
                //             if (count > 1) {
                //               count--;
                //             }
                //           }
                //           setState(() {});
                //         })
                // ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Button(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/cart.svg',
                            height: 15.h,
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          MaterialButton(onPressed: (){
                            CartItem newItem = CartItem(
                              price: widget.price,
                              imageSrc: widget.imageSrc,
                              name: widget.name, id: widget.id,
                            );
                            // Use Provider to add the item to the cart
                            Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
                            Navigate.navigateTo(context, Cart());
                          },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
