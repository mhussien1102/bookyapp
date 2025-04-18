import 'package:bookyapp/core/utils/assets.dart';
import 'package:bookyapp/core/utils/style.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookyapp/features/home/presentation/views/widgets/featured_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedListViewBlocConsumer(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  textAlign: TextAlign.left,
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: BestSellerListViewBlocBuilder(),
          ),
        )
      ],
    );
  }
}
