import 'package:flutter/material.dart';
import 'package:kodlrprojec/models/promotionItemModel.dart';

class PromotionItems extends StatefulWidget {
  const PromotionItems({super.key, required this.items});
  final List<itemModel> items;
  @override
  State<PromotionItems> createState() => _PromotionItemsState();
}

class _PromotionItemsState extends State<PromotionItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.items.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.items[index].image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 140,
                ),
                SizedBox(height: 8),
                Text(
                  " ${widget.items[index].title}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  " ${widget.items[index].description}",
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  " ${widget.items[index].price.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {},
                    child: Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
