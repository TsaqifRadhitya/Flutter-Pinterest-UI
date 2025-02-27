import 'package:get/get.dart';
import 'package:get_x/app/data/models/Product.dart';
import 'package:get_x/app/data/providers/fakeApi.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

  final ProductList = List<Product>.empty().obs;
  final count = 0.obs;

  @override
  void onReady(){
    super.onReady();
    fetchProduct();
  }


  void fetchProduct() async {
    ProductList.value = await FakerApiProvider().fetchProduct();
  }

  void increment() => count.value++;
}
