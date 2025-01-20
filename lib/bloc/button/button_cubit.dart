// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:football_app/bloc/button/button_state.dart';
import 'package:football_app/core/usecases/usecases.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {},
        (data) {
          emit(ButtonLoadedState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: "Error: ${e.toString()}"));
    }
  }
}
