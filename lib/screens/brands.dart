import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:hardware_store/widgets/brandcard_widget.dart';
import 'package:hardware_store/widgets/gridlayout_widget.dart';
import 'package:hardware_store/widgets/jsonimport/brandsload.dart';
import 'package:hardware_store/widgets/networkconnection.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';


class BrandListScreen extends StatelessWidget {
  const BrandListScreen({super.key});

   @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const AppBarWidget(title: Text('Brands'), showBackArrow: true),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Brands>>(
          future: ReadJsonData(),
          builder: (context, data) {
            // to indicate connection
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.hasError) {
              return const Center(
                  child: Text('Error fetching data, please try again'));
            } else if (!data.hasData || data.data == null) {
              return const Center(child: Text('No data available'));
            } else {
              var items = data.data!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                     const NetworkConnection(),
                    // Heading
                    const SectionHeadingWidget(
                        title: 'Brands', showActionButton: false),
                    const SizedBox(
                      height: 12,
                    ),

                    // Brands
                    GridLayoutWidget(
                      itemcount: items.length,
                      mainAxisExtent: 80,
                      itemBuilder: (context, index) => BrandCardWidget(
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
      ),
    );
  }

Future<List<Brands>> ReadJsonData() async {
  // load data in json
  final jsondata =  await rootBundle.rootBundle.loadString('assets/json/brands.json');
  // Decode JSON data
  final Map<String, dynamic> decodedData = json.decode(jsondata);
  
  // Extract the list under "Brands"
  final List<dynamic> brandsList = decodedData['Brands'];

  // Convert the list to a list of Brands objects
  return brandsList.map((data) => Brands.fromJson(data)).toList();
  
}
}