import 'package:core/base/base_state.dart';
import 'package:core/base/base_status.dart';

class ProductState extends BaseState {
  final String id;

  ProductState({
    super.status,
    required this.id,
  });

  ProductState.initial() : id = '';

  @override
  ProductState copyWith({
    BaseStatus? status,
    String? id,
  }) {
    return ProductState(
      status: status ?? this.status,
      id: id ?? this.id,
    );
  }

  ProductState setId(String id) {
    return copyWith(id: id);
  }
}
