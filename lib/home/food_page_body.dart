import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_application/utils/colors.dart';
import 'package:flutter_application/utils/dimensions.dart';
import 'package:flutter_application/widgets/big_text.dart';
import 'package:flutter_application/widgets/icon_and_text.dart';
import 'package:flutter_application/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeColor: AppColors.mainColor,
          ),
        ),
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              BigText(
                text: '.',
                color: Colors.black26,
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: 'Food pairing'),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                bottom: Dimensions.height10,
              ),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: const DecorationImage(
                        image: AssetImage('images/midu1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTxtSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: 'Nutritious fruit meal in China'),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: 'With Chinese characteristic'),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                IconAndText(
                                  icon: Icons.circle_sharp,
                                  text: 'Normal',
                                  iconColor: AppColors.iconColor1,
                                ),
                                IconAndText(
                                  icon: Icons.location_on,
                                  text: '1.7km',
                                  iconColor: AppColors.mainColor,
                                ),
                                IconAndText(
                                  icon: Icons.access_time_rounded,
                                  text: '32min',
                                  iconColor: AppColors.iconColor1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor() ||
        index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransition = (_height * (1 - currentScale)) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransition = (_height * (1 - currentScale)) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    } else {
      var currentScale = 0.8;
      var currentTransition = (_height * (1 - currentScale)) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransition, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
            left: Dimensions.width10,
            right: Dimensions.width10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xFF9294cc),
            image: const DecorationImage(
              image: AssetImage('images/midu1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.height30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(Dimensions.height15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Chinese Side'),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: '4.5'),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: '1297'),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: 'comments'),
                    ],
                  ),
                  SizedBox(height: Dimensions.height15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      IconAndText(
                        icon: Icons.circle_sharp,
                        text: 'Normal',
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndText(
                        icon: Icons.location_on,
                        text: '1.7km',
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndText(
                        icon: Icons.access_time_rounded,
                        text: '32min',
                        iconColor: AppColors.iconColor1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
