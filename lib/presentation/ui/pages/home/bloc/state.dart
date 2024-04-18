import 'package:equatable/equatable.dart';

import '../../../item_models/bank_service_item.dart';

abstract class HomePageState extends Equatable {}

class InitialHomePageState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class LoadingHomePageLoadingState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class SuccessHomePageState extends HomePageState {
  final List<BankServiceItem> items;
  SuccessHomePageState({required this.items});

  @override
  List<Object?> get props => [items];
}

class ErrorHomePageState extends HomePageState {
  ErrorHomePageState({
    this.message = '',
  });

  @override
  List<Object?> get props => [];

  final String message;
}
