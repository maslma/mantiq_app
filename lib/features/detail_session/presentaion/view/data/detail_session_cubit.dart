import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_session_state.dart';

class DetailSessionCubit extends Cubit<DetailSessionState> {
  DetailSessionCubit() : super(DetailSessionInitial());
}
