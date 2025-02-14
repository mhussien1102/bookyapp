import 'package:bookyapp/core/utils/assets.dart';
import 'package:bookyapp/core/utils/style.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(
            height: 50,
          ),
          Text(
            textAlign: TextAlign.left,
            "Best Seller",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20,
          ),
          BestSellerListViewItem()
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(AssetsData.book1), fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  "Harry potter and the Goblat of fire",
                  style: Styles.textStyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
