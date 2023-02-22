import 'package:flutter/material.dart';

class HeaderWithMenu extends StatelessWidget {
  final String header;
  final GlobalKey<ScaffoldState> scaffoldKey;
  HeaderWithMenu({
    super.key,
    required this.header,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: Text(
            header,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
          padding: const EdgeInsets.all(0),
          icon: Icon(
            Icons.menu,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}