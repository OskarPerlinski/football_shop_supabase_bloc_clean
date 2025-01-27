import 'package:football_app/data/auth/repository/auth.dart';
import 'package:football_app/data/auth/source/auth_supabase_service.dart';
import 'package:football_app/data/brands/repository/brands.dart';
import 'package:football_app/data/brands/source/brands_supabase_source.dart';
import 'package:football_app/data/cart/repository/cart.dart';
import 'package:football_app/data/cart/source/cart_supabase_service.dart';
import 'package:football_app/data/club_collections/repository/club_collections.dart';
import 'package:football_app/data/club_collections/source/club_collections_supabase_source.dart';
import 'package:football_app/data/products/repository/products.dart';
import 'package:football_app/data/products/source/products_supabase_service.dart';
import 'package:football_app/domain/auth/repository/auth.dart';
import 'package:football_app/domain/auth/usecases/is_logged_in.dart';
import 'package:football_app/domain/auth/usecases/reset_password.dart';
import 'package:football_app/domain/auth/usecases/sign_in.dart';
import 'package:football_app/domain/auth/usecases/sign_up.dart';
import 'package:football_app/domain/brands/repository/brands.dart';
import 'package:football_app/domain/brands/usecase/brands.dart';
import 'package:football_app/domain/cart/repository/cart.dart';
import 'package:football_app/domain/cart/usecases/add_to_cart.dart';
import 'package:football_app/domain/cart/usecases/get_cart_products.dart';
import 'package:football_app/domain/club_collections/repository/club_collections.dart';
import 'package:football_app/domain/club_collections/usecase/club_collections.dart';
import 'package:football_app/domain/products/repository/products.dart';
import 'package:football_app/domain/products/usecases/get_by_collections.dart';
import 'package:football_app/domain/products/usecases/new_products.dart';
import 'package:football_app/domain/products/usecases/get_by_brand_id.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialzeDependencies() async {
  //services
  sl.registerSingleton<AuthSupabaseService>(AuthSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<ClubCollectionsSupabaseSource>(ClubCollectionsSupabaseSourceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<BrandsSupabaseSource>(BrandsSupabaseSourceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<ProductsSupabaseService>(ProductsSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<CartSupabaseService>(CartSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<ClubCollectionsRepository>(ClubCollectionsRepositoryImpl());
  sl.registerSingleton<BrandsReposiotry>(BrandsRepositoryImpl());
  sl.registerSingleton<ProductsReposiotry>(ProductsRepositoryImpl());
  sl.registerSingleton<CartReposiotry>(CartReposiotryImpl());
  //usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<ClubCollectionsUseCase>(ClubCollectionsUseCase());
  sl.registerSingleton<BrandsUseCase>(BrandsUseCase());
  sl.registerSingleton<NewProductsUseCase>(NewProductsUseCase());
  sl.registerSingleton<GetByBrandIdUseCase>(GetByBrandIdUseCase());
  sl.registerSingleton<GetByCollectionsUseCase>(GetByCollectionsUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
}