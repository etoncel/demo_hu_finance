import '../../../item_models/bank_service_item.dart';

abstract class HomePageState {
  final List<BankServiceItem> items;

  HomePageState({required this.items});
}

class InitialHomePageState extends HomePageState {
  InitialHomePageState({required super.items});
}

class LoadingHomePageLoadingState extends HomePageState {
  LoadingHomePageLoadingState() : super(items: []);
}

class SuccessHomePageState extends HomePageState {
  SuccessHomePageState({required super.items});
}

class ErrorHomePageState extends HomePageState {
  ErrorHomePageState({
    required super.items,
    this.message = '',
  });

  final String message;
}
