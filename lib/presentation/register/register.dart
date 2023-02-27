import 'package:flutter/material.dart';
import 'package:project_1/app/di.dart';
import 'package:project_1/presentation/register/register_viewmodel.dart';
import '../common/state_renderer/state_render_impl.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameTextEditingController = TextEditingController();
  TextEditingController _mobileNumberTextEditingController = TextEditingController();
  TextEditingController _userEmailEditingController = TextEditingController();
  TextEditingController _PasswordTextEditingController = TextEditingController();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
    _userNameTextEditingController.addListener(() {_viewModel.setUserName(_userNameTextEditingController.text);});
    _mobileNumberTextEditingController.addListener(() {_viewModel.setMobileNumber(_mobileNumberTextEditingController.text);});
    _userEmailEditingController.addListener(() {_viewModel.setEmail(_userEmailEditingController.text);});
    _PasswordTextEditingController.addListener(() {_viewModel.setPassword(_PasswordTextEditingController.text);});
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        iconTheme: IconThemeData(
          color: ColorManager.primary
        ),
        backgroundColor: ColorManager.white,
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.register();
                }) ??
                _getContentWidget(),
          );
        },
      ),
    );
  }

Widget _getContentWidget() {
  return Container(
    // padding: EdgeInsets.only(top: AppPadding.p8),
    child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image(image: AssetImage(ImageAssets.splashLogo)),
            SizedBox(height: AppSize.s28),
            // Name TextEditField
            Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<String?>(
                stream: _viewModel.outputErrorUserName,
                builder: (context, snapshot) {
                  return TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _userNameTextEditingController,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        hintText: AppStrings.name,
                        labelText: AppStrings.name,
                        errorText: (snapshot.data)),
                  );
                },
              ),
            ),
            SizedBox(height: AppSize.s28),
            // Email TextEditField
            Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputIsPasswordValid,
                builder: (context, snapshot) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _userEmailEditingController,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        hintText: AppStrings.email,
                        labelText: AppStrings.email,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordError),
                  );
                },
              ),
            ),
            SizedBox(height: AppSize.s28),
            // Password TextEditField
            Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<String?>(
                stream: _viewModel.outputErrorPassword,
                builder: (context, snapshot) {
                  return TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _PasswordTextEditingController,
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.primary, width: AppSize.s1),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.error, width: AppSize.s1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppSize.s12),
                          ),
                          borderSide: BorderSide(
                              color: ColorManager.grey, width: AppSize.s1),
                        ),
                        hintText: AppStrings.password,
                        labelText: AppStrings.password,
                        errorText: (snapshot.data ),),
                  );
                },
              ),
            ),
            SizedBox(height: AppSize.s28),
            // Register Button
            Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputsValid,
                builder: (context, snapshot) {
                  return SizedBox(
                    width: double.infinity,
                    height: AppSize.s40,
                    child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)
                            ? () {
                          _viewModel.register();
                        }
                            : null,
                        child: Text(AppStrings.register)),
                  );
                },
              ),
            ),
            // Already have an account? Login Button
            Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p8,
                left: AppPadding.p28,
                right: AppPadding.p28,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.have_account,
                      textAlign: TextAlign.end,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}}
