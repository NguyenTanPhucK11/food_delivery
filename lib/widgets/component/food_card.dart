import 'package:flutter/material.dart';
import 'package:food_delivery/themes/app_colors.dart';
import 'package:food_delivery/themes/text_styles.dart';

class FoodCard extends StatelessWidget {
  final bool onlyMoney;
  final bool isRateReOrder;
  final bool isColorPrimary;
  final bool isTwice;
  final bool isOngoing;
  final bool isTimeSpaceRating;

  const FoodCard({
    @required this.isOngoing,
    @required this.onlyMoney,
    @required this.isRateReOrder,
    @required this.isColorPrimary,
    @required this.isTwice,
    @required this.isTimeSpaceRating,
  });
  @override
  Widget build(BuildContext context) {
    final _sizeImage = 74.0;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16, bottom: isTwice ? 8 : 16),
          padding: EdgeInsets.only(left: 24, right: 24),
          height: _sizeImage,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/1.0x/shrimp.png',
                  width: _sizeImage,
                  height: _sizeImage,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Creamos',
                      style: StylesText.headline16,
                    ),
                    Text(
                      '1x Brown Tornado',
                      style: StylesText.caption.copyWith(
                        color: AppColors.neutral3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _onlyMoney()
                  ],
                ),
              )
            ],
          ),
        ),
        _twiceByYou(),
        _buildRateReOrder(_width),
        Divider(height: 0),
      ],
    );
  }

  _onlyMoney() {
    return Row(
      mainAxisAlignment:
          onlyMoney ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        isTimeSpaceRating
            ? Row(
                children: [
                  Icon(
                    Icons.access_time_outlined,
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '15 mins',
                    style: StylesText.caption.copyWith(
                      color: AppColors.neutral1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.circle,
                    size: 5,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '1.1 km',
                    style: StylesText.caption.copyWith(
                      color: AppColors.neutral1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : isOngoing
                ? Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        color: AppColors.primaryOrangeRed,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '05:00',
                        style: StylesText.bodyText15.copyWith(
                          color: AppColors.primaryOrangeRed,
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  )
                : SizedBox(),
        Row(
          children: [
            Text(
              '\$ 16.00',
              style: StylesText.headline16.copyWith(
                color: isColorPrimary
                    ? AppColors.primaryOrange
                    : AppColors.neutral1,
              ),
            ),
            SizedBox(width: 10),
            onlyMoney
                ? Text(
                    '\$ 20.00',
                    style: StylesText.caption.copyWith(
                      color: AppColors.neutral3,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : SizedBox()
          ],
        ),
      ],
    );
  }

  _twiceByYou() {
    return Container(
      padding: EdgeInsets.only(left: 24),
      child: Column(
        children: [
          isTwice
              ? Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 12,
                      color: AppColors.neutral3,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'twice by you',
                      style: StylesText.caption.copyWith(
                        color: AppColors.neutral3,
                      ),
                    )
                  ],
                )
              : SizedBox(),
          _distantHeight(2),
        ],
      ),
    );
  }

  _buildRateReOrder(_width) {
    return isRateReOrder
        ? Container(
            padding: EdgeInsets.only(bottom: 16, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _width * 0.29,
                  height: _width * 0.077,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // shadowColor: Colors.white,
                      elevation: 0,
                      primary: AppColors.neutral6,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(6.0),
                        side: BorderSide(
                          color: AppColors.neutral2,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'RATE',
                        style: StylesText.bodyText13.copyWith(
                          color: AppColors.neutral2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: _width * 0.29,
                  height: _width * 0.077,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // shadowColor: Colors.white,
                      elevation: 0,
                      primary: AppColors.neutral6,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(6.0),
                        side: BorderSide(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'RE-ORDER',
                      style: StylesText.bodyText13.copyWith(
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  _distantHeight(int scales) {
    return SizedBox(
      height: scales * 4.0,
    );
  }

  _distantWidth(int scales) {
    return SizedBox(
      width: scales * 4.0,
    );
  }
}
