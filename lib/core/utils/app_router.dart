import 'package:freely/Featuer/spalsh_view/presentation/view/splash_view2.dart';
import 'package:go_router/go_router.dart';
import 'package:freely/Featuer/Auth/forget_password/presentation/view/forget_password.dart';
import 'package:freely/Featuer/Auth/login/presentation/view/login_view.dart';
import 'package:freely/Featuer/Auth/register/presentation/view/register_view.dart';
import 'package:freely/Featuer/Home%20page/data/categouris_model.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/hompage_view.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/widget/details_product.dart';
import 'package:freely/Featuer/HomeNavigationBar/presentation/view/navigation_bar_view.dart';
import 'package:freely/Featuer/spalsh_view/presentation/view/splah_view.dart';

abstract class AppRouter {
  static const ksplashView = '/';
  static const ksplashView2 = '/splashView';
  static const kloginView = '/loginView';
  static const kRigesterView = '/rigesterView';
  static const kForgetView = '/forgetpassowrdView';
  static const kResetpasswordView = '/resetpasswordView';
  static const kdetailsproduct = '/detailsproduct';
  static const knavigationbar = '/navigatiobar';
  static const khomeview = '/homeview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        path: ksplashView2,
        builder: (context, state) => const SplahView2(),
      ),
      GoRoute(path: kloginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kForgetView,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: kRigesterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: knavigationbar,
        builder: (context, state) => const HomePageNavigationBar(),
      ),
      GoRoute(
        path: khomeview,
        builder: (context, state) => const HomPageView(),
      ),
      GoRoute(
        path: kdetailsproduct,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return DetailsProduct(detailsProduct: product);
        },
      ),
    ],
  );
}
