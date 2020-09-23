import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq/model/organisation_info.dart';
import 'package:smartq/repositories/repositories.dart';

abstract class InfoEvent extends Equatable {
  final id;

  InfoEvent({this.id});

  @override
  List<Object> get props => [id];
}

abstract class InfoState extends Equatable {
  final OrgInfo orgInfo;

  InfoState({this.orgInfo});

  @override
  List<Object> get props => [orgInfo];
}

class EmptyInfo extends InfoState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoadingInfo extends InfoState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class FetchingInfo extends InfoEvent {
  final id;

  FetchingInfo({this.id});

  @override
  List<Object> get props => [id];
}

class LoadedInfo extends InfoState {
  final OrgInfo orgInfo;

  LoadedInfo({this.orgInfo});

  @override
  List<Object> get props => [orgInfo];
}

class OrgInfoBloc extends Bloc<InfoEvent, InfoState> {
  OrgInfoBloc(InfoState initialState) : super(initialState);

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    if (event is FetchingInfo) {
      yield* mapFetchingLoaded(event);
    }
  }

  Stream<InfoState> mapFetchingLoaded(InfoEvent event) async* {
    yield LoadingInfo();
    var id = event.id;
    var api = SmartqClient(api: "$API_ORG_INFO$id", baseUrl: BASE_URL);
    var responseInfo = await api.getResponse();

    print(responseInfo);

    yield LoadedInfo(orgInfo: OrgInfo.fromJson(responseInfo));
  }
}
