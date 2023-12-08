import 'package:bloc/bloc.dart';
import 'package:supplychain_beras/services/auth_service.dart';

import '../../models/DataBeras.dart';

part 'supplychain_event.dart';
part 'supplychain_state.dart';

class SupplychainBloc extends Bloc<SupplychainEvent, SupplychainState> {
  SupplychainBloc() : super(SupplychainInitial()) {
    AuthService auth = AuthService();
    on<SupplychainEvent>((event, emit) async {
      if (event is GetDataBeras) {
        emit(DataBerasLoading());
        try {
          var data = await auth.GetDataBeras(id: event.id);
          emit(DataBerasLoaded(data: data));
        } catch (e) {
          emit(DataBerasFailed(err: e.toString()));
        }
      }

      if (event is CreateAsset) {
        emit(DataBerasLoading());
        try {
          await auth.createasset(
              id: event.id,
              jenisberas: event.jenisberas,
              namapetani: event.namapetani,
              alamat: event.alamat,
              tanggalpanen: event.tanggalpanen);
          emit(DataBerasSukses());
        } catch (e) {
          emit(DataBerasFailed(err: e.toString()));
        }
      }
      if (event is LockAsset) {
        emit(DataBerasLoading());
        try {
          await auth.lockasset(
            id: event.id,
          );
          emit(DataBerasSukses());
          var data = await auth.GetDataBeras(id: event.id);
          emit(DataBerasLoaded(data: data));
        } catch (e) {
          emit(DataBerasFailed(err: e.toString()));
        }
      }

      if (event is TransferAsset) {
        emit(DataBerasLoading());
        try {
          await auth.transferasset(
              id: event.id,
              tanggaldiolah: event.tanggaldiolah,
              alamatperusahaan: event.alamatperusahaan,
              jumlah: event.jumlah);
          emit(DataBerasSukses());
        } catch (e) {
          emit(DataBerasFailed(err: e.toString()));
        }
      }
    });
  }
}
