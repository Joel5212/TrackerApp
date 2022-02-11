import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'initiative_state.dart';

class InitiativeCubit extends Cubit<InitiativeState> {
  InitiativeCubit() : super(InitiativeInitial());
}
