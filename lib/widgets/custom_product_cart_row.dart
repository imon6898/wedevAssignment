import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProductCardRow extends StatelessWidget {
  final String? image;
  final String? productName;
  final double? discountPrice;
  final double? currentPrice;
  final double? initialRating;

  const CustomProductCardRow({
    Key? key,
    this.image,
    this.productName,
    this.discountPrice,
    this.currentPrice,
    this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Column
        Container(
          width: 160.42,
          height: 177.16,
          child: Image.asset(
            image!,
            fit: BoxFit.fill,
          ),
        ),
        // Second Column
        Container(
          width: 160.42,
          height: 113,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
          ),

          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName!,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 13.89,
                  color: Colors.black,
                  letterSpacing: 0.13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '\$$discountPrice',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xFF989FA8),
                          letterSpacing: 0.14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '\$$currentPrice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  RatingBar.builder(
                    initialRating: initialRating!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
