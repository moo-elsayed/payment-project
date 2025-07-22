import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/checkout/data/data_sources/stripe/stripe_checkout_remote_data_source.dart';
import '../../features/checkout/data/repos/stripe/stripe_checkout_repo_imp.dart';
import '../../features/checkout/domain/use_cases/stripe/stripe_checkout_use_case.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(dio: Dio()),
  );
  getIt.registerSingleton<StripeCheckoutUseCase>(
    StripeCheckoutUseCase(
      stripeCheckOutRepo: StripeCheckOutRepoImp(
        stripeCheckoutRemoteDataSourceImp: StripeCheckoutRemoteDataSourceImp(
          apiService: getIt.get<ApiService>(),
        ),
      ),
    ),
  );
}
