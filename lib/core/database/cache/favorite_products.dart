// import 'package:shared_preferences/shared_preferences.dart';

// class FavoritesManager {
//   static const String _key = 'favorite_products';

//   // استرجاع القائمة
//   static Future<List<int>> getFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     final favorites = prefs.getStringList(_key);
//     return favorites?.map(int.parse).toList() ?? [];
//   }

//   // إضافة معرف للمنتجات المفضلة
//   static Future<void> addFavorite(int productId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final favorites = await getFavorites();
//     if (!favorites.contains(productId)) {
//       favorites.add(productId);
//       await prefs.setStringList(
//           _key, favorites.map((e) => e.toString()).toList());
//     }
//   }

//   // إزالة معرف من القائمة
//   static Future<void> removeFavorite(int productId) async {
//     final prefs = await SharedPreferences.getInstance();
//     final favorites = await getFavorites();
//     favorites.remove(productId);
//     await prefs.setStringList(
//         _key, favorites.map((e) => e.toString()).toList());
//   }
// }
