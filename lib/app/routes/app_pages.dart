import 'package:get/get.dart';

import '../modules/address/addressAdd/bindings/address_add_binding.dart';
import '../modules/address/addressAdd/views/address_add_view.dart';
import '../modules/address/addressEdit/bindings/address_edit_binding.dart';
import '../modules/address/addressEdit/views/address_edit_view.dart';
import '../modules/address/addressList/bindings/address_list_binding.dart';
import '../modules/address/addressList/views/address_list_view.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/me/bindings/me_binding.dart';
import '../modules/me/views/me_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/orderInfo/bindings/order_info_binding.dart';
import '../modules/orderInfo/views/order_info_view.dart';
import '../modules/pass/codeLoginStepOne/bindings/code_login_step_one_binding.dart';
import '../modules/pass/codeLoginStepOne/views/code_login_step_one_view.dart';
import '../modules/pass/codeLoginStepTwo/bindings/code_login_step_two_binding.dart';
import '../modules/pass/codeLoginStepTwo/views/code_login_step_two_view.dart';
import '../modules/pass/oneStepLogin/bindings/one_step_login_binding.dart';
import '../modules/pass/oneStepLogin/views/one_step_login_view.dart';
import '../modules/pass/passWordLogin/bindings/pass_word_login_binding.dart';
import '../modules/pass/passWordLogin/views/pass_word_login_view.dart';
import '../modules/pass/registerStepOne/bindings/register_step_one_binding.dart';
import '../modules/pass/registerStepOne/views/register_step_one_view.dart';
import '../modules/pass/registerStepThree/bindings/register_step_three_binding.dart';
import '../modules/pass/registerStepThree/views/register_step_three_view.dart';
import '../modules/pass/registerStepTwo/bindings/register_step_two_binding.dart';
import '../modules/pass/registerStepTwo/views/register_step_two_view.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/productContent/bindings/product_content_binding.dart';
import '../modules/productContent/views/product_content_view.dart';
import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/searchs/bindings/searchs_binding.dart';
import '../modules/searchs/views/searchs_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

// import '../modules/search/bindings/search_binding.dart';
// import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 100),
      name: _Paths.SEARCHS,
      page: () => const SearchsView(),
      binding: SearchsBinding(),
    ),
    GetPage(
      name: _Paths.ME,
      page: () => const MeView(),
      binding: MeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_CONTENT,
      page: () => const ProductContentView(),
      binding: ProductContentBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_ONE,
      page: () => const CodeLoginStepOneView(),
      binding: CodeLoginStepOneBinding(),
    ),
    GetPage(
      name: _Paths.CODE_LOGIN_STEP_TWO,
      page: () => CodeLoginStepTwoView(),
      binding: CodeLoginStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.ONE_STEP_LOGIN,
      page: () => const OneStepLoginView(),
      binding: OneStepLoginBinding(),
    ),
    GetPage(
      name: _Paths.PASS_WORD_LOGIN,
      page: () => const PassWordLoginView(),
      binding: PassWordLoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_ONE,
      page: () => const RegisterStepOneView(),
      binding: RegisterStepOneBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_TWO,
      page: () => const RegisterStepTwoView(),
      binding: RegisterStepTwoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_STEP_THREE,
      page: () => const RegisterStepThreeView(),
      binding: RegisterStepThreeBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_LIST,
      page: () => const AddressListView(),
      binding: AddressListBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_ADD,
      page: () => const AddressAddView(),
      binding: AddressAddBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_EDIT,
      page: () => const AddressEditView(),
      binding: AddressEditBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () => const PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_INFO,
      page: () => const OrderInfoView(),
      binding: OrderInfoBinding(),
    ),
  ];
}
