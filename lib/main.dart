import 'package:flutter/material.dart';
import 'package:kodlrprojec/Providers/mainProvider.dart';
import 'package:kodlrprojec/Screen/mobileScreen/firstSliderbar.dart';
import 'package:kodlrprojec/Screen/mobileScreen/mainMobileScreen.dart';
import 'package:kodlrprojec/constants/appconstants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => mainProvider())],

      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Builder(
          builder: (context) {
            double width = MediaQuery.of(context).size.width;

            if (context.watch<mainProvider>().isMobile(width)) {
              return _buildMobileAppBar(context);
            } else if (context.watch<mainProvider>().isDesktop(width)) {
              return _buildDesktopAppBar(context);
            } else {
              throw Exception("Can't open the page , Please try again");
            }
          },
        ),
      ),
      body:
          context.read<mainProvider>().isMobile(
            MediaQuery.of(context).size.width,
          )
          ? MainMobileScreen()
          : context.watch<mainProvider>().isDesktop(
              MediaQuery.of(context).size.width,
            )
          ? Text("Desktop View", style: TextStyle(fontSize: 24))
          : Text("Unknown View", style: TextStyle(fontSize: 24)),
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu, color: Colors.black),
      ),

      centerTitle: true,
      title: Image.asset("assets/icons/logo.png", height: 60, width: 100),

      actions: [
        IconButton(
          onPressed: () {},
          icon: context.read<mainProvider>().isHovered
              ? Icon(Icons.shopping_bag, color: Colors.black)
              : Icon(Icons.card_travel, color: Colors.grey),

          onHover: (value) {
            context.read<mainProvider>().Tap(value);
          },
        ),
      ],
    );
  }

  Widget _buildDesktopAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      titleSpacing: 20,
      leading: Image.asset("assets/icons/logo.png", height: 60, width: 100),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navItem("Homes"),
          _navItem("Shop"),
          _navItem("Promotion"),
          _navItem("News"),
          _navItem("About"),
        ],
      ),

      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
          onPressed: () {},
        ),
        SizedBox(width: 20),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {},
              color: Colors.black,
            ),
            SizedBox(width: 5),
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
      ],
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
