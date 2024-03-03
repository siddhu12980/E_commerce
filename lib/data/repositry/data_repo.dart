import 'package:e_com/data/data_model.dart';
import 'package:e_com/data/data_provider/data_provider.dart';

class DataRepository {
  final ProductDataProvider dataProvider;

  DataRepository(this.dataProvider);

  // Future<List<ProductData>> getData() async {
  //   try {
  //     // Fetch product data from the data provider
  //     final List<Map<String, dynamic>> productDataList =
  //         await dataProvider.fetchProductData();

  //     // Convert raw data into a list of ProductData instances
  //     final List<ProductData> productList =
  //         productDataList.map((data) => ProductData.fromMap(data)).toList();

  //     return productList;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<List<ProductData>> getData(
      {bool filterCart = false, bool filterFavorites = false}) async {
    try {
      // Fetch product data from the data provider
      final List<Map<String, dynamic>> productDataList =
          await dataProvider.fetchProductData();

      // Convert raw data into a list of ProductData instances
      final List<ProductData> productList =
          productDataList.map((data) => ProductData.fromMap(data)).toList();

      // Filter products based on cart and favorites flags
      if (filterCart && filterFavorites) {
        return productList
            .where((product) => product.iscart && product.isfav)
            .toList();
      } else if (filterCart) {
        return productList.where((product) => product.iscart).toList();
      } else if (filterFavorites) {
        return productList.where((product) => product.isfav).toList();
      } else {
        return productList;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
