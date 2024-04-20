import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skill_harvest_app/ApiService/model/products.dart';
import 'package:skill_harvest_app/apiPage/controller/page_controller.dart';

class ApiPage extends ConsumerStatefulWidget {
  const ApiPage({super.key});

  @override
  ConsumerState<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends ConsumerState<ApiPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(apiController.notifier).fetchAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ref.watch(apiController.select((value) => value.isBusy))
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      )
                    : Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: ref.watch(apiController
                              .select((value) => value.list?.length ?? 0)),
                          itemBuilder: (BuildContext context, int index) {
                            final productList = ref.read(
                                apiController.select((value) => value.list));
                            if (productList == null || productList.isEmpty) {
                              return SizedBox.fromSize();
                            }
                            return TileWidget(
                              product: productList[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Gap(12);
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  final Product product;
  const TileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.15),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        trailing: const Icon(Icons.book),
        title: Text(
          product.title ?? 'empty',
          maxLines: 1,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.body ?? 'empty',
          maxLines: 2,
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
