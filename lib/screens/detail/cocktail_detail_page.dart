import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CocktailDetailPage extends StatefulWidget {
  final String cocktailId;

  CocktailDetailPage({
    required this.cocktailId,
  });

  @override
  State createState() => _CocktailDetailPageState(cocktailId: cocktailId);
}

class _CocktailDetailPageState extends State<CocktailDetailPage> {
  final String cocktailId;

  _CocktailDetailPageState({
    required this.cocktailId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(cocktailId),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('戻る'),
        ),
      ],
    );
  }
}
