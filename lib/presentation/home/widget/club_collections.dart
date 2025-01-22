import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/club_collections/club_collections_cubit.dart';
import 'package:football_app/bloc/club_collections/club_collections_state.dart';
import 'package:football_app/domain/club_collections/entity/club_collections.dart';

class ClubCollections extends HookWidget {
  const ClubCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (context) => ClubCollectionsCubit()..displayClubCollections(),
        child: BlocBuilder<ClubCollectionsCubit, ClubCollectionsState>(
          builder: (context, state) {
            if (state is ClubCollectionsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ClubCollectionsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _clubCollectionsText(),
                  const SizedBox(height: 20),
                  _collections(state.collections),
                ],
              );
            }
            if (state is FailureLoadClubCollections) {
              return const Center(
                child: Text('Failed to load...'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _clubCollectionsText() {
    return const Text(
      'Club Collections',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _collections(List<ClubCollectionsEntity> collections) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          collections.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(collections[index].image),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  collections[index].league,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
