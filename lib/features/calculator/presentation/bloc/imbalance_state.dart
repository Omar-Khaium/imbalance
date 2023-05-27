// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'imbalance_bloc.dart';

abstract class ImbalanceState {}

class ImbalanceInitial extends ImbalanceState {
  final double imbalance;
  ImbalanceInitial({
    required this.imbalance,
  });
}

class ImbalanceLongProfit extends ImbalanceInitial {
  final double total;
  final double alpha;
  final double beta;
  ImbalanceLongProfit({
    required super.imbalance,
    required this.total,
    required this.alpha,
    required this.beta,
  });
}

class ImbalanceLongLoss extends ImbalanceInitial {
  final double total;
  final double alpha;
  final double beta;
  ImbalanceLongLoss({
    required super.imbalance,
    required this.total,
    required this.alpha,
    required this.beta,
  });
}

class ImbalanceShortProfit extends ImbalanceInitial {
  final double total;
  final double alpha;
  final double beta;
  ImbalanceShortProfit({
    required super.imbalance,
    required this.total,
    required this.alpha,
    required this.beta,
  });
}

class ImbalanceShortLoss extends ImbalanceInitial {
  final double total;
  final double alpha;
  final double beta;
  ImbalanceShortLoss({
    required super.imbalance,
    required this.total,
    required this.alpha,
    required this.beta,
  });
}
