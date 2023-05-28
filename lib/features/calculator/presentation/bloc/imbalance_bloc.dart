import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'imbalance_event.dart';
part 'imbalance_state.dart';

class ImbalanceBloc extends Bloc<ImbalanceEvent, ImbalanceState> {
  //! Long profit
  double longProfitAlpha = 0, longProfitBeta = 0;
  //! Long loss
  double longLossAlpha = 0, longLossBeta = 0;

  //! Short profit
  double shortProfitAlpha = 0, shortProfitBeta = 0;
  //! Short loss
  double shortLossAlpha = 0, shortLossBeta = 0;

  ImbalanceBloc() : super(ImbalanceInitial(imbalance: double.nan)) {
    on<ImbalanceEvent>((event, emit) {
      if (event is LongProfit) {
        longProfitAlpha = event.alpha;
        longProfitBeta = event.beta;

        emit(
          ImbalanceLongProfit(
            imbalance: imbalance(),
            total: longProfit(),
            alpha: longProfitAlpha,
            beta: longProfitBeta,
          ),
        );
      } else if (event is LongLoss) {
        longLossAlpha = event.alpha;
        longLossBeta = event.beta;

        emit(
          ImbalanceLongLoss(
            imbalance: imbalance(),
            total: longLoss(),
            alpha: longLossAlpha,
            beta: longLossBeta,
          ),
        );
      } else if (event is ShortProfit) {
        shortProfitAlpha = event.alpha;
        shortProfitBeta = event.beta;

        emit(
          ImbalanceShortProfit(
            imbalance: imbalance(),
            total: shortProfit(),
            alpha: shortProfitAlpha,
            beta: shortProfitBeta,
          ),
        );
      } else if (event is ShortLoss) {
        shortLossAlpha = event.alpha;
        shortLossBeta = event.beta;

        emit(
          ImbalanceShortLoss(
            imbalance: imbalance(),
            total: shortLoss(),
            alpha: shortLossAlpha,
            beta: shortLossBeta,
          ),
        );
      }
    });
  }

  double longProfit() {
    return (longProfitAlpha - longProfitBeta).abs();
  }

  double longLoss() {
    return (longLossAlpha + longLossBeta).abs();
  }

  double shortProfit() {
    return (shortProfitAlpha + shortProfitBeta).abs();
  }

  double shortLoss() {
    return (shortLossAlpha - shortLossBeta).abs();
  }

  double imbalance() {
    final double lp = longProfit();
    final double ll = longLoss();
    final double sp = shortProfit();
    final double sl = shortLoss();
    return (ll == 0 || sl == 0) ? double.nan : (lp / ll) - (sp / sl);
  }
}
