import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/data/model/response/product_model.dart';
import 'package:medosedo_ecommerce/provider/product_provider.dart';
import 'package:medosedo_ecommerce/utill/dimensions.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_widget.dart';
import 'package:provider/provider.dart';

class FeaturedProductView extends StatelessWidget {
  final ScrollController? scrollController;
  final bool isHome;

  FeaturedProductView({this.scrollController, required this.isHome});

  @override
  Widget build(BuildContext context) {
    int offset = 1;
    scrollController?.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
              scrollController!.position.pixels &&
          Provider.of<ProductProvider>(context, listen: false)
                  .featuredProductList
                  .length !=
              0 &&
          !Provider.of<ProductProvider>(context, listen: false)
              .isFeaturedLoading) {
        int pageSize;

        pageSize = Provider.of<ProductProvider>(context, listen: false)
            .featuredPageSize;

        if (offset < pageSize) {
          offset++;
          print('end of the page');
          Provider.of<ProductProvider>(context, listen: false)
              .showBottomLoader();

          Provider.of<ProductProvider>(context, listen: false)
              .getLatestProductList(offset, context);
        }
      }
    });

    return Consumer<ProductProvider>(
      builder: (context, prodProvider, child) {
        List<Product> productList;
        productList = prodProvider.featuredProductList;

        return Column(children: [
          !prodProvider.firstFeaturedLoading
              ? productList.length != 0
                  ? Container(
                      height: Dimensions.CARD_HEIGHT,
                      child: isHome
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productList.length,
                              itemBuilder: (ctx, index) {
                                return Container(
                                    width: (MediaQuery.of(context).size.width /
                                            2) -
                                        20,
                                    child: ProductWidget(
                                        productModel: productList[index]));
                              })
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: productList.length,
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductWidget(
                                    productModel: productList[index]);
                              },
                            ),
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: true,
                  isEnabled: prodProvider.firstFeaturedLoading),
          prodProvider.isFeaturedLoading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.all(Dimensions.ICON_SIZE_EXTRA_SMALL),
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))
              : SizedBox.shrink(),
        ]);
      },
    );
  }
}
