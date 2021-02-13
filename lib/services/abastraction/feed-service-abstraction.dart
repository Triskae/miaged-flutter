import 'package:Miaged/common/models/product.dart';

abstract class FeedServiceAbstraction {
  Future<List<Product>> getAllProducts ();
  Future<Product> getProduct(int id);
  Future<List<Product>> getAllProductsByCategory();
  
}