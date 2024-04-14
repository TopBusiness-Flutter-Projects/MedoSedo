import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/data/model/response/category.dart';
import 'package:medosedo_ecommerce/localization/language_constrants.dart';
import 'package:medosedo_ecommerce/provider/category_provider.dart';
import 'package:medosedo_ecommerce/provider/splash_provider.dart';
import 'package:medosedo_ecommerce/provider/theme_provider.dart';
import 'package:medosedo_ecommerce/utill/color_resources.dart';
import 'package:medosedo_ecommerce/utill/custom_themes.dart';
import 'package:medosedo_ecommerce/utill/dimensions.dart';
import 'package:medosedo_ecommerce/utill/images.dart';
import 'package:medosedo_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:medosedo_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

import '../../../provider/product_provider.dart';
import '../../basewidget/no_internet_screen.dart';
import '../../basewidget/product_shimmer.dart';
import '../../basewidget/product_widget.dart';
import '../home/widget/category_widget.dart';

class AllCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [
          CustomAppBar(title: getTranslated('CATEGORY', context)),
          Expanded(child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: categoryProvider.categoryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BrandAndCategoryProductScreen(
                                    isBrand: false,
                                    id: categoryProvider.categoryList[index].id
                                        .toString(),
                                    name: categoryProvider
                                        .categoryList[index].name,
                                  )));
                    },
                    child: CategoryWidget(
                        category: categoryProvider.categoryList[index]),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }

  List<Widget> _getSubSubCategories(
      BuildContext context, SubCategory subCategory) {
    List<Widget> _subSubCategories = [];
    _subSubCategories.add(Container(
      color: ColorResources.getIconBg(context),
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: ListTile(
        title: Row(
          children: [
            Container(
              height: 7,
              width: 7,
              decoration: BoxDecoration(
                  color: ColorResources.getPrimary(context),
                  shape: BoxShape.circle),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Flexible(
                child: Text(
              getTranslated('all', context),
              style: titilliumSemiBold.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge!.color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BrandAndCategoryProductScreen(
                        isBrand: false,
                        id: subCategory.id.toString(),
                        name: subCategory.name,
                      )));
        },
      ),
    ));
    for (int index = 0; index < subCategory.subSubCategories.length; index++) {
      _subSubCategories.add(Container(
        color: ColorResources.getIconBg(context),
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: ListTile(
          title: Row(
            children: [
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    color: ColorResources.getPrimary(context),
                    shape: BoxShape.circle),
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Flexible(
                  child: Text(
                subCategory.subSubCategories[index].name,
                style: titilliumSemiBold.copyWith(
                    color: Theme.of(context).textTheme.bodyLarge!.color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BrandAndCategoryProductScreen(
                          isBrand: false,
                          id: subCategory.subSubCategories[index].id.toString(),
                          name: subCategory.subSubCategories[index].name,
                        )));
          },
        ),
      ));
    }
    return _subSubCategories;
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  CategoryItem(
      {required this.title, required this.icon, required this.isSelected});

  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isSelected ? ColorResources.getPrimary(context) : null,
      ),
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hintColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                fit: BoxFit.cover,
                image:
                    '${Provider.of<SplashProvider>(context, listen: false).baseUrls.categoryImageUrl}/$icon',
                imageErrorBuilder: (c, o, s) =>
                    Image.asset(Images.placeholder, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: titilliumSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  color: isSelected
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hintColor,
                )),
          ),
        ]),
      ),
    );
  }
}
