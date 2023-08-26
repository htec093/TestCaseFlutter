import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../config/app_theme.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../widgets/general_button_widget.dart';
import '../controllers/pokemons_controller.dart';

class PokemonsView extends GetView<PokemonsController> {
  const PokemonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Obx(() {
        return bodyWidget(context);
      }),
    );
  }

  Widget bodyWidget(BuildContext context) {
    switch (controller.screenState.value) {
      case 0:
        return dataWidget(context);
      case 1:
        return errorWidget(context);
      case 2:
        return emptyWidget(context);
      default:
        return const SizedBox();
    }
  }

  Widget dataWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPage,
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(Strings.pokemons.tr),
            automaticallyImplyLeading: true,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: controller.pokemonList.isEmpty
                ? SliverToBoxAdapter(
                    child: Container(
                    height: 80.h,
                    child: SpinKitFadingCircle(
                      color: Theme.of(context).primaryColor,
                      size: 20.w,
                    ),
                  ))
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return pokemonItemWidget(index, context);
                      },
                      childCount: controller.isLoading.value
                          ? controller.pokemonList.length + 1
                          : controller.pokemonList.length,
                    ),
                  ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            sliver: const SliverToBoxAdapter(),
          ),
        ],
      ),
    );
  }

  Widget errorWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPage,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(Strings.pokemons.tr),
            automaticallyImplyLeading: true,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
            sliver: SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 50.sp,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.failure!.message.tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 30,
                ),
                GeneralButton(
                  width: 40.w,
                  height: 12.w,
                  color: AppColors.mainColor(1),
                  borderColor: AppColors.mainColor(1),
                  textColor: Colors.white,
                  text: Strings.tryAgain.tr,
                  onTap: () {
                    controller.refreshPage();
                  },
                ),
              ],
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            sliver: const SliverToBoxAdapter(),
          ),
        ],
      ),
    );
  }

  Widget emptyWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPage,
      color: AppColors.mainColor(1),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(Strings.pokemons.tr),
            automaticallyImplyLeading: true,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
            sliver: SliverToBoxAdapter(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_no_pokemons.png',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'No Pokemons',
                  style: Theme.of(context).textTheme.displaySmall,
                  overflow: TextOverflow.clip,
                ),
              ],
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10.w),
            sliver: const SliverToBoxAdapter(),
          ),
        ],
      ),
    );
  }

  Widget pokemonItemWidget(int index, BuildContext context) {
    if (controller.isLoading.value) {
      if (controller.pokemonList.length == index) {
        return Container(
          height: controller.isLoading.value ? 50.0 : 0,
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor(1),
            ),
          ),
        );
      } else {
        return pokemonCard(index, context);
      }
    } else {
      return pokemonCard(index, context);
    }
  }

  Widget pokemonCard(int index, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      elevation: 2,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 30.w,
              width: 30.w,
              imageUrl: controller.pokemonList.elementAt(index).url!,
              placeholder: (context, url) => Image.asset(
                'assets/images/loading.gif',
                fit: BoxFit.fill,
                height: 30.w,
                width: 30.w,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 4.w,),
          Text(
            controller.pokemonList.elementAt(index).name!,
          ),
        ],
      ),
    );
  }
}
