import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templateapp/features/auth/presentation/authorization/bloc/authorization_bloc.dart';
import 'package:templateapp/styles/edges.dart';
import 'package:templateapp/utils/translation_extensions.dart';
import 'package:templateapp/widgets/text_fields/labeled_text_field_widget.dart';

class AuthBox extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorizationBloc, AuthorizationState>(listener: (context, state) {
      if (state is AuthorizationError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.appError.message)));
      }
      if (state is AuthorizationSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.token)));
        //context.pushNamed(Routes.home);
      }
    }, builder: (context, state) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Edges.edgeExtraLarge),
            ),
            boxShadow: kElevationToShadow[4],
          ),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                LabeledTextField(
                  controller: emailController,
                  label: context.translate.email,
                  type: TextInputType.emailAddress,
                  isRequired: true,
                ),
                const SizedBox(height: Edges.edge),
                LabeledTextField(
                  controller: passwordController,
                  label: context.translate.password,
                  type: TextInputType.visiblePassword,
                  isRequired: true,
                ),
                const SizedBox(height: Edges.edge),
                ElevatedButton(
                  onPressed: () => _onLoginTap(context),
                  child: Text(context.translate.login),
                ),
                if (state is AuthorizationLoading)
                  const CircularProgressIndicator(
                    color: Colors.red,
                  )
              ],
            ),
          ),
        ),
      );
    });
  }

  void _onLoginTap(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthorizationBloc>().add(AuthorizationOnLogin(email: emailController.text, password: passwordController.text));
    }
  }
}
