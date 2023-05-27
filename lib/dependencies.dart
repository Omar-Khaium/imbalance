import 'package:calculator/core/color.dart';
import 'package:calculator/features/calculator/presentation/bloc/imbalance_bloc.dart';
import 'package:get_it/get_it.dart';

final dependency = GetIt.instance;

Future<void> inject() async {
  dependency.registerFactory(() => AppColor());
  dependency.registerFactory(() => ImbalanceBloc());
}
