import 'package:equatable/equatable.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';

enum ShopStatus { loading, missing, ready, failure }

class ShopState extends Equatable {
  const ShopState({this.status = ShopStatus.loading, this.shop, this.submitting = false});
  final ShopStatus status;
  final ShopModel? shop;
  final bool submitting;

  @override
  List<Object?> get props => [status, shop, submitting];
}
