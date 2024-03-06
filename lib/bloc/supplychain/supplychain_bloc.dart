import 'package:bloc/bloc.dart';
import 'package:supplychain_beras/services/auth_service.dart';
import '../../models/data_beras.dart';

part 'supplychain_event.dart';
part 'supplychain_state.dart';

class SupplychainBloc extends Bloc<SupplychainEvent, SupplychainState> {
  SupplychainBloc() : super(SupplychainInitial()) {
    AuthService auth = AuthService();

    on<GetDataBeras>((event, emit) async {
      emit(DataBerasLoading());
      try {
        var data = await auth.getDataBeras(id: event.id);
        emit(DataBerasLoaded(data: data));
      } catch (e) {
        emit(DataBerasFailed(err: e.toString()));
      }
    });
    on<CreateAsset>((event, emit) async {
      emit(DataBerasLoading());
      try {
        await auth.createasset(
            id: event.id,
            nohp: event.nohp,
            lamapanen: event.lamapanen,
            namapetani: event.namapetani,
            alamat: event.alamat,
            tanggalpanen: event.tanggalpanen);
        emit(DataBerasSukses());
      } catch (e) {
        emit(DataBerasFailed(err: e.toString()));
      }
    });
    on<LockAsset>((event, emit) async {
      emit(DataBerasLoading());
      try {
        await auth.lockasset(
          id: event.id,
        );
        emit(DataBerasSukses());
        var data = await auth.getDataBeras(id: event.id);
        emit(DataBerasLoaded(data: data));
      } catch (e) {
        emit(DataBerasFailed(err: e.toString()));
      }
    });
    on<TransferAssetToWholesaler>((event, emit) async {
      emit(DataBerasLoading());
      try {
        await auth.transferassetToWholesaler(
            id: event.id, jumlah: event.jumlah);
        emit(DataBerasSukses());
      } catch (e) {
        emit(DataBerasFailed(err: e.toString()));
      }
    });

    on<ToInitial>((event, emit) async {
      emit(SupplychainInitial());
    });
  }
}
