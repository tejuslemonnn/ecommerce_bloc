import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_bloc/models/category_model.dart';
import 'package:ecommerce_bloc/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('categories').snapshots().map(
        (event) =>
            event.docs.map((docs) => Category.fromSnapshot(docs)).toList());
  }
}
