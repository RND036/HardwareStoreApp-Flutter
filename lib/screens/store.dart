import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:get/get.dart';
import 'package:hardware_store/Theme/colors.dart';
import 'package:hardware_store/screens/brands.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/brandcard_widget.dart';
import 'package:hardware_store/widgets/category_tab.dart';
import 'package:hardware_store/widgets/counter_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/jsonimport/brandsload.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/searchbar_widget.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';
import 'package:hardware_store/widgets/shimmer.dart';
import 'package:hardware_store/widgets/tabbar_widget.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBarWidget(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: CounterWidget(
                iconColor: (isDarkMode ? HColors.light : HColors.dark),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: NestedScrollView // to add multiple scroll views
            (
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading:
                      false, // remove automatic icons of app bar
                  pinned: true, // to pinned the app bar without moving
                  floating: true, // to visible the app bar when scrolling
                  backgroundColor: (isDarkMode
                      ? HColors.dark
                      : HColors.light), //to do add dark mode effect here,
                  expandedHeight: 440, //expanded height of the app bar

                  // to add items inside app bar
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
                      shrinkWrap: true, // shrink content to the child size
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 16),
                        const SearchBarWidget(
                          text: 'Search In Tech.',
                          showBackground: false,
                          showBorder: true,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 16),

                        // brands

                        SectionHeadingWidget(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () => Get.to(const BrandListScreen(),
                              transition: Transition.zoom,
                              duration: const Duration(
                                  milliseconds:
                                      300)), // Pass the required 'brands' argument here
                        ),
                        const SizedBox(height: 16),
                        FutureBuilder<List<Brands>>(
                          future: ReadJsonData(),
                          builder: (context, data) {
                            // to indicate connection
                            if (data.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: ShimmerBuilder());
                            } else if (data.hasError) {
                              return const Center(
                                  child: Text(
                                      'Error fetching data, please try again'));
                            } else if (!data.hasData || data.data == null) {
                              return const Center(
                                  child: Text('No data available'));
                            } else {
                              var items = data.data!;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const NetworkConnection(),
                                    // Brands
                                    GridLayoutWidget(
                                      itemcount: 4,
                                      mainAxisExtent: 80,
                                      itemBuilder: (context, index) =>
                                          BrandCardWidget(
                                        title: items[index].title,
                                        subtitle: items[index].description,
                                        image: items[index].image.toString(),
                                        isDarkMode: isDarkMode,
                                        showborder: true,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  // tabs
                  bottom: const TabbarWidget(tabs: [
                    Tab(child: Text('Hand Tools')),
                    Tab(child: Text('Power Tools')),
                    Tab(child: Text('Paints')),
                    Tab(child: Text('Plumbing')),
                    Tab(child: Text('Building Items')),
                  ])),
            ];
          },
          // tabs body
          body: TabBarView(
            children: [
              CategoryTab(
                isDarkMode: isDarkMode,
                image1: 'assets/images/categories/handtools.png',
                image2: 'assets/images/categories/hand1.png',
                image3: 'assets/images/categories/handtoolbox.png',
                image4: 'assets/images/categories/hand2.png',
                image5: 'assets/images/categories/toolbox.png',
                image6: 'assets/images/categories/hand3.png',
                brandimage: 'assets/images/brands/craftman.png',
                brandtitle: 'Craftman',
                brandsubtitle: '400 products',
              ),
              CategoryTab(
                  isDarkMode: isDarkMode,
                  image1: 'assets/images/categories/powertools.png',
                  image2: 'assets/images/categories/grinder.png',
                  image3: 'assets/images/categories/circular-saw.png',
                  image4: 'assets/images/categories/powertool4.png',
                  image5: 'assets/images/categories/powertool3.png',
                  image6: 'assets/images/categories/powertool6.png',
                  brandimage: 'assets/images/brands/stanleylogo.png',
                  brandtitle: 'Stanley',
                  brandsubtitle: '200 products'),
              CategoryTab(
                  isDarkMode: isDarkMode,
                  image1: 'assets/images/categories/paint.png',
                  image2: 'assets/images/categories/paint1.png',
                  image3: 'assets/images/categories/paint5.png',
                  image4: 'assets/images/categories/paint.png',
                  image5: 'assets/images/categories/dulex2.png',
                  image6: 'assets/images/categories/dulex3.png',
                  brandimage: 'assets/images/brands/blackdecor.png',
                  brandtitle: 'Black Decor',
                  brandsubtitle: '150 products'),
              CategoryTab(
                  isDarkMode: isDarkMode,
                  image1: 'assets/images/categories/balllock.png',
                  image2: 'assets/images/categories/plumbin1.png',
                  image3: 'assets/images/categories/tap.png',
                  image4: 'assets/images/categories/plumbing.png',
                  image5: 'assets/images/categories/plumbing2.png',
                  image6: 'assets/images/categories/plumbing3.png',
                  brandimage: 'assets/images/brands/DeWalt.png',
                  brandtitle: 'Dewalt',
                  brandsubtitle: '150 products'),
              CategoryTab(
                  isDarkMode: isDarkMode,
                  image1: 'assets/images/categories/buildingitem.png',
                  image2: 'assets/images/categories/bricks.png',
                  image3: 'assets/images/categories/bricks2.png',
                  image4: 'assets/images/categories/steelrod.png',
                  image5: 'assets/images/categories/sand.png',
                  image6: 'assets/images/categories/stone.png',
                  brandimage: 'assets/images/brands/markitanew.png',
                  brandtitle: 'Markita',
                  brandsubtitle: '250 products'),
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<Brands>> ReadJsonData() async {
  // load data in json
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/json/brands.json');
  // Decode JSON data
  final Map<String, dynamic> decodedData = json.decode(jsondata);

  // Extract the list under "Brands"
  final List<dynamic> brandsList = decodedData['Brands'];
  // Convert the list to a list of Brands objects
  return brandsList.map((data) => Brands.fromJson(data)).toList();
}
