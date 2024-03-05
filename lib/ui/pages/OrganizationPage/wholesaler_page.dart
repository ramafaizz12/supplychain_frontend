part of '../pages.dart';

Widget userwholesaler() {
  return BlocBuilder<SupplychainBloc, SupplychainState>(
    builder: (context, state) {
      if (state is DataBerasLoaded) {
        if (state.data!.konfirmasi_wholesaler != true) {
          return konfirmasset();
        }
        if (state.data!.konfirmasi_wholesaler != false) {
          return checkasset();
        }
      }
      return checkasset();
    },
  );
}
