import 'package:flutter/material.dart';
import 'package:medosedo_ecommerce/provider/product_provider.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:medosedo_ecommerce/view/basewidget/product_widget.dart';
import 'package:provider/provider.dart';

class RelatedProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, prodProvider, child) {
        return Column(children: [
          prodProvider.relatedProductList != null
              ? prodProvider.relatedProductList.length != 0
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          crossAxisCount: 2),
                      itemCount: prodProvider.relatedProductList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(
                            productModel:
                                prodProvider.relatedProductList[index]);
                      },
                    )
                  : Center(child: Text('No related Product'))
              : ProductShimmer(
                  isHomePage: false,
                  isEnabled: Provider.of<ProductProvider>(context)
                          .relatedProductList ==
                      null),
        ]);
      },
    );
  }
}
