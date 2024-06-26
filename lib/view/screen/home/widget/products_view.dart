import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/data/model/response/product_model.dart';
import 'package:medosedo_ecommerce/helper/product_type.dart';
import 'package:medosedo_ecommerce/provider/product_provider.dart';
import 'package:medosedo_ecommerce/utill/dimensions.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_widget.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final bool isHomePage;
  final ProductType productType;
  final ScrollController? scrollController;
  final String? sellerId;
  ProductView(
      {required this.isHomePage,
      required this.productType,
      this.scrollController,
      this.sellerId});

  @override
  Widget build(BuildContext context) {
    if (productType == ProductType.SELLER_PRODUCT) {
      Provider.of<ProductProvider>(context, listen: false)
          .initSellerProductList(sellerId!, 1, context);
    }
    int offset = 1;
    // scrollController?.addListener(() {
    //   if (scrollController!.position.maxScrollExtent ==
    //           scrollController!.position.pixels &&
    //       Provider.of<ProductProvider>(context, listen: false)
    //               .latestProductList
    //               .length !=
    //           0 &&
    //       !Provider.of<ProductProvider>(context, listen: false)
    //           .filterIsLoading) {
    //     int pageSize = 0;
    //     if (productType == ProductType.BEST_SELLING ||
    //         productType == ProductType.TOP_PRODUCT ||
    //         productType == ProductType.NEW_ARRIVAL) {
    //       pageSize = (Provider.of<ProductProvider>(context, listen: false)
    //                   .latestPageSize /
    //               10)
    //           .ceil();
    //       offset = Provider.of<ProductProvider>(context, listen: false).lOffset;
    //     } else if (productType == ProductType.SELLER_PRODUCT) {
    //       pageSize = (Provider.of<ProductProvider>(context, listen: false)
    //                   .sellerPageSize /
    //               10)
    //           .ceil();
    //       offset =
    //           Provider.of<ProductProvider>(context, listen: false).sellerOffset;
    //     }
    //     if (offset < pageSize) {
    //       print('offset =====>$offset and page sige ====>$pageSize');
    //       offset++;

    //       print('end of the page');
    //       Provider.of<ProductProvider>(context, listen: false)
    //           .showBottomLoader();

    //       if (productType == ProductType.SELLER_PRODUCT) {
    //         Provider.of<ProductProvider>(context, listen: false)
    //             .initSellerProductList(sellerId!, offset, context,
    //                 reload: false);
    //       } else {
    //         Provider.of<ProductProvider>(context, listen: false)
    //             .getLatestProductList(offset, context);
    //       }
    //     } else {}
    //   }
    // });
    scrollController?.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
              scrollController!.position.pixels &&
          Provider.of<ProductProvider>(context, listen: false)
                  .latestProductList
                  .length !=
              0 &&
          !Provider.of<ProductProvider>(context, listen: false)
              .filterIsLoading) {
        int pageSize = 0;
        ProductProvider productProvider =
            Provider.of<ProductProvider>(context, listen: false);

        if (productType == ProductType.BEST_SELLING ||
            productType == ProductType.TOP_PRODUCT ||
            productType == ProductType.NEW_ARRIVAL) {
          pageSize = (productProvider.latestPageSize / 10).ceil();
          offset = productProvider.lOffset;
        } else if (productType == ProductType.SELLER_PRODUCT) {
          pageSize = (productProvider.sellerPageSize / 10).ceil();
          offset = productProvider.sellerOffset;
        }

        /// pagination
        if (offset < pageSize) {
          print('offset =====> $offset and page size ====> $pageSize');
          offset++;

          print('end of the page');
          productProvider.showBottomLoader();

          if (productType == ProductType.SELLER_PRODUCT) {
            productProvider.initSellerProductList(sellerId!, offset, context,
                reload: false);
          } else {
            productProvider.getLatestProductList(
              offset,
              context,
            );
          }
        }
      }
    });

    return Consumer<ProductProvider>(
      builder: (context, prodProvider, child) {
        List<Product> productList = [];
        if (productType == ProductType.LATEST_PRODUCT) {
          productList = prodProvider.lProductList;
        } else if (productType == ProductType.FEATURED_PRODUCT) {
          productList = prodProvider.featuredProductList;
        } else if (productType == ProductType.TOP_PRODUCT) {
          productList = prodProvider.latestProductList;
        } else if (productType == ProductType.BEST_SELLING) {
          productList = prodProvider.latestProductList;
        } else if (productType == ProductType.NEW_ARRIVAL) {
          productList = prodProvider.latestProductList;
        } else if (productType == ProductType.SELLER_PRODUCT) {
          productList = prodProvider.sellerProductList;
          print(
              '==========>Product List ==${prodProvider.firstLoading}====>${productList.length}');
        }

        print('========hello hello===>${productList.length}');

        return Column(children: [
          !prodProvider.filterFirstLoading
              ? productList.length != 0
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 3.5 / 5,
                          crossAxisSpacing: 2),
                      itemCount: isHomePage
                          ? productList.length > 4
                              ? 4
                              : productList.length
                          : productList.length,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(productModel: productList[index]);
                      },
                    )
                  : SizedBox.shrink()
              : ProductShimmer(
                  isHomePage: isHomePage, isEnabled: prodProvider.firstLoading),
          prodProvider.filterIsLoading
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
