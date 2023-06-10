import 'dart:convert';

import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/banner_model/banner_model.dart';
import 'package:dfcart/models/category_model/category_model.dart';
import 'package:dfcart/models/product_model/flash_sale_model.dart';
import 'package:dfcart/models/product_model/popular_product_model.dart';
import 'package:dfcart/models/product_model/product_model.dart';
import 'package:dfcart/utils/routes.dart';
import 'package:dfcart/widgets/home_screen_widges/all_products_widget.dart';
import 'package:dfcart/widgets/home_screen_widges/category_widget.dart';
import 'package:dfcart/widgets/home_screen_widges/flash_sale_widget.dart';
import 'package:dfcart/widgets/home_screen_widges/popular_products_widget.dart';
import 'package:dfcart/widgets/home_screen_widges/product_widget.dart';
import 'package:flutter/services.dart';
import 'package:masonry_grid/masonry_grid.dart';
import '../../widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List of categories, banners, flash sale products, popular products, all products
  final List<CategoryModel> loadedCategories = [];
  final List<BannerModel> loadedBanners = [];
  final List<FlashSaleProductModel> loadedFlashSaleProducts = [];
  final List<PopularProductModel> loadedPopularProducts = [];
  final List<ProductModel> loadedAllProducts = [];

  //Fetch categories from json
  Future<void> fetchCategories() async {
    final response =
        await rootBundle.loadString("assets/jsons/category_data.json");
    final data = await json.decode(response);
    final categories = data["categories"] as List;
    for (var element in categories) {
      loadedCategories.add(CategoryModel.fromJson(element));
    }
    setState(() {});
  }

  //Fetch products from json
  Future<void> fetchProduct() async {
    final response =
        await rootBundle.loadString("assets/jsons/product_details.json");
    final data = await json.decode(response);
    final products = data["products"] as List;
    setState(() {});
  }

  //Fetch banners from json
  Future<void> fetchBanners() async {
    final response =
        await rootBundle.loadString("assets/jsons/promo_banners.json");
    final data = await json.decode(response);
    final banners = data["promo_images"] as List;
    for (var element in banners) {
      loadedBanners.add(BannerModel.fromJson(element));
    }
    setState(() {});
  }

  //Fetch flash sale products from json
  Future<void> fetchFlashSaleProducts() async {
    final response =
        await rootBundle.loadString("assets/jsons/flash_sale_products.json");
    final data = await json.decode(response);
    final products = data["products"] as List;
    for (var item in products) {
      loadedFlashSaleProducts.add(FlashSaleProductModel.fromJson(item));
    }
    setState(() {});
  }

  //Fetch popular products from json
  Future<void> fetchPopularProducts() async {
    final response =
        await rootBundle.loadString("assets/jsons/popular_products.json");
    final data = await json.decode(response);
    final products = data["products"] as List;
    for (var item in products) {
      loadedPopularProducts.add(PopularProductModel.fromJson(item));
    }
    setState(() {});
  }

  //Fetch All products from json
  Future<void> fetchAllProducts() async {
    final response =
        await rootBundle.loadString("assets/jsons/all_products.json");
    final data = await json.decode(response);
    final products = data["products"] as List;
    for (var item in products) {
      loadedAllProducts.add(ProductModel.fromJson(item));
    }
    print(loadedAllProducts[0].name);
    setState(() {});
  }

  @override
  void initState() {
    fetchCategories();
    fetchBanners();
    fetchFlashSaleProducts();
    fetchPopularProducts();
    fetchAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      //-------------------AppBar-------------------//
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: primaryColor, // Set your desired icon color here
        ),
        actions: [
          ButtonBar(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF2F2F2)),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: textColors,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search anything",
                        style: TextStyle(color: textColors),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_sharp,
                  color: primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView(children: [
        const SizedBox(
          height: 10,
        ),

        //-------------------Categories-------------------//
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(
                width: 10,
              ),
              for (var item in loadedCategories)
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: CategoryView(
                        item: item,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                )
            ]),
          ),
        ),
        //-------------------Banners-------------------//
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.17,
          child: CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.17,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {});
              },
            ),
            items: loadedBanners
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(item.url),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //-------------------Flash Sale-------------------//
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
                  child: const Row(
                    children: [
                      Text(
                        "Flash Sale",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColors,
                        ),
                      ),
                    ],
                  ),
                ),
                FlashSaleWidget(
                    loadedFlashSaleProducts: loadedFlashSaleProducts),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //-------------------Popular Products-------------------//
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
                  child: const Row(
                    children: [
                      Text(
                        "Popular Products",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColors,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PopularProductsWidget(
                    loadedPopularProducts: loadedPopularProducts),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //-------------------All Products-------------------//

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.white, backgroundColor],
                begin: Alignment.topCenter,
                end: FractionalOffset(
                    0, 200 / MediaQuery.of(context).size.height),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "All Products",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColors,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //AllProductsWidget(loadedAllProducts: loadedAllProducts),
                Container(
                    child: MasonryGrid(
                  column: 2,
                  children: [
                    for (var item in loadedAllProducts)
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetailRoute,
                            );
                          },
                          child: ProductViewWidget(product: item)),
                  ],
                ))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
