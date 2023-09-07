import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: DropShadowImage(
          borderRadius: 10,

          //@blurRadius if not defined default value is
          blurRadius: 10,
          //@offset default value is Offset(8,8)
          offset: Offset(5, 5),
          //@scale if not defined default value is 1
          scale: 1.05,
          image: Image.asset(
            "../assets/Images/Logo.png",
            height: 250,
            // width: 250,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
