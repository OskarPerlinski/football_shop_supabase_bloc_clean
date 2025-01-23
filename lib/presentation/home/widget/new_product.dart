import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/product_card/product_card.dart';

class NewProduct extends HookWidget {
  const NewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _newText(),
        const SizedBox(height: 20),
        _newProducts(),
      ],
    );
  }
  
  Widget _newText() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'New',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

   Widget _newProducts() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ProductCard();
          },
          separatorBuilder: (context, index) =>  const SizedBox(width: 10),
          itemCount: 4,
        ),
      ),
    );
  }
}