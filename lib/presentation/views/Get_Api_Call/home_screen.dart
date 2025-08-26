import 'package:fake_store/presentation/controllers/Get_Api_call/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer(builder: (context, HomeController controller, _) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: controller.productsList.length,
                  itemBuilder: (context, index) {
                    final productList = controller.productsList[index];
                    return ListTile(
                      title: Text(productList.title ?? ""),
                    );
                  }),
            )
          ],
        );
      }),
    ));
  }
}
