import 'package:Miaged/common/models/product.dart';

abstract class FeedServiceAbstraction {
  Future<List<Product>> getAllProducts ([String category]);
  Future<Product> getProduct(int id);

}
