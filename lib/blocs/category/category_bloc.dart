import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc/models/models.dart';
import 'package:ecommerce_bloc/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategories(categories),
          ),
        );
  }

  void _onUpdateCategories(
      UpdateCategories event, Emitter<CategoryState> emit) {
    emit(
      CategoryLoaded(categories: event.categories),
    );
  }
}
