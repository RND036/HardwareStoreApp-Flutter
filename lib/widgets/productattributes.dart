import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/choicechip.dart';
import 'package:hardware_store/widgets/container/circularcontainer.dart';
import 'package:hardware_store/widgets/sectionheading_widget.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        // selected attributs pricing and descrption
        CircularContainer(
          padding: const EdgeInsets.all(12),
          backgroundColor: isDarkMode ? Colors.grey : Colors.grey,
          radius: 12,
          child: Column(
            children: [
              // title,price nad stock status
              Row(
                children: [
                  const SectionHeadingWidget(
                    title: 'Variations',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Price :',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          // actual price
                          Text(
                            'Rs.500',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          //sla price
                          Text('Rs.250',
                              style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                      // stock
                      Row(
                        children: [
                          Text(
                            'Stock',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      // variation description
                      Text(
                        'descrption of the product',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        // attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeadingWidget(title: 'Sizes', showActionButton: false),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChipWidget(label:'S', selected: true, onSelected: (Value){}, text: 'S',),
                ChoiceChipWidget(label:'M', selected: true, onSelected: (Value){}, text: 'M',),
                ChoiceChipWidget(label:'L', selected: true, onSelected: (Value){}, text: 'L',),
            

              ],
            )

            // to make choices of sizes
            
          ],
        )
      ],
    );
  }
}

