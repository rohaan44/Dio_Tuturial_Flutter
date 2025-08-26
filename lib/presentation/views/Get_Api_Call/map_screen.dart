import 'package:fake_store/presentation/controllers/Get_Api_call/map_controller..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<MapController>(builder: (context, controller, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.map == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: controller.map!.data.length,
                        itemBuilder: (context, index) {
                          final data = controller.map!.data[index];
                          return ListTile(
                            title: Text(data.firstName.toString()),
                          );
                        }))
          ],
        );
      }),
    ));
  }
}
