import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tijara/views/home_screen/home_provider.dart';

class FavoriteButton extends StatefulWidget {
  final String adId;

  const FavoriteButton({super.key, required this.adId});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  void checkFavoriteStatus() async {
    bool favStatus =
    await context.read<HomeProvider>().isAdFavorite(widget.adId);
    setState(() {
      isFavorite = favStatus;
    });
  }

  void toggleFavorite() async {
    await context.read<HomeProvider>().toggleFavoriteBook(widget.adId);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.black,
        size: 25,
      ),
      onPressed: toggleFavorite,
    );
  }
}