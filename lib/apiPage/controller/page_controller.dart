// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skill_harvest_app/ApiService/api_service.dart';
import 'package:skill_harvest_app/ApiService/model/products.dart';

class ApiPageController extends StateNotifier<ApiPageUiState> {
  ApiPageController() : super(ApiPageUiState());

  Future<void> fetchAllProducts() async {
    _isBusy(true);

    final list = await ApiService.getProduct();

    if (list != null) {
      state = state.copyWith(productList: list);
    }

    _isBusy(false);
  }

  _isBusy(bool isBusy) {
    state = state.copyWith(apiIsBusy: isBusy);
  }
}

final apiController = StateNotifierProvider<ApiPageController, ApiPageUiState>(
    (ref) => ApiPageController());

class ApiPageUiState {
  final List<Product>? list;
  final bool isBusy;

  ApiPageUiState({
    this.list,
    this.isBusy = false,
  });

  ApiPageUiState copyWith({
    List<Product>? productList,
    bool? apiIsBusy,
  }) {
    return ApiPageUiState(
      list: productList ?? list,
      isBusy: apiIsBusy ?? isBusy,
    );
  }
}