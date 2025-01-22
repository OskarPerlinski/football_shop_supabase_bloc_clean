import 'package:bloc/bloc.dart';
import 'package:football_app/bloc/club_collections/club_collections_state.dart';
import 'package:football_app/domain/club_collections/usecase/club_collections.dart';
import 'package:football_app/service_locator.dart';

class ClubCollectionsCubit extends Cubit<ClubCollectionsState> {
  ClubCollectionsCubit() : super(ClubCollectionsInitial());

  void displayClubCollections() async {
    var returnedData = await sl<ClubCollectionsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadClubCollections());
      },
      (data) {
        emit(ClubCollectionsLoaded(collections: data));
      },
    );
  }
}
