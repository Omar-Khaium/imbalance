part of 'imbalance_bloc.dart';

@immutable
abstract class ImbalanceEvent {}

class LongProfit extends ImbalanceEvent {
  final double alpha;
  final double beta;
  LongProfit({
    required this.alpha,
    required this.beta,
  });
}

class LongLoss extends ImbalanceEvent {
  final double alpha;
  final double beta;
  LongLoss({
    required this.alpha,
    required this.beta,
  });
}

class ShortProfit extends ImbalanceEvent {
  final double alpha;
  final double beta;
  ShortProfit({
    required this.alpha,
    required this.beta,
  });
}

class ShortLoss extends ImbalanceEvent {
  final double alpha;
  final double beta;
  ShortLoss({
    required this.alpha,
    required this.beta,
  });
}
