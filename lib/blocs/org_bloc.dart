import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartq/model/organisation.dart';
import 'package:smartq/repositories/repositories.dart';

abstract class OrgEvent extends Equatable {
  final List<Organisation> organisations;

  OrgEvent({this.organisations});
}

abstract class OrgState extends Equatable {
  final List<Organisation> organisations;

  OrgState({this.organisations});
}

class FetchOrg extends OrgEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class EmptyOrg extends OrgState {
  @override
  List<Object> get props => [organisations];
}

class LoadingOrg extends OrgState {
  @override
  List<Object> get props => [organisations];
}

class LoadedOrg extends OrgState {
  final List<Organisation> organisations;

  LoadedOrg({this.organisations});
  @override
  // TODO: implement props
  List<Object> get props => [organisations];
}

class OrgBloc extends Bloc<OrgEvent, OrgState> {
  OrgBloc(OrgState initialState) : super(initialState);

  @override
  Stream<OrgState> mapEventToState(OrgEvent event) async* {
    if (event is FetchOrg) {
      yield* mapFetchToLoaded(event);
    }
  }

  Stream<OrgState> mapFetchToLoaded(OrgEvent event) async* {
    var fetchedList = SmartqClient(api: API_ORG_LIST, baseUrl: BASE_URL);
    var orgList = await fetchedList.getResponse();

    print(orgList.length);

    yield LoadedOrg(
        organisations:
            List.from(orgList).map((f) => Organisation.fromJson(f)).toList());
  }
}
