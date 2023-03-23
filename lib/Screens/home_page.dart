import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zigy_assignment/services/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final apiServices = Provider.of<ApiServices>(context, listen: false);
    apiServices.getMyData();
  }

  @override
  Widget build(BuildContext context) {
    final apiServices = Provider.of<ApiServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Zigy Assignment")),
      ),
      body: apiServices.isLoading
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [Center(child: SizedBox())],
                    );
                  }),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: apiServices.responseData.data!.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        apiServices.responseData.data![i].avatar!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(apiServices.responseData.data![i].firstName!),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(apiServices.responseData.data![i].email!),
                          ],
                        ),
                      ),
                    ],
                  )),
                );
              }),
    );
  }
}
