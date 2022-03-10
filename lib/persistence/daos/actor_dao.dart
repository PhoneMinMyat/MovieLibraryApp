import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/persistence/hive_constants.dart';

class ActorDao {
  static final ActorDao _singleton = ActorDao._internal();

  factory ActorDao() {
    return _singleton;
  }

  ActorDao._internal();

  void saveAllActors(List<ActorVO> actorList) async {
    Map<int, ActorVO> actorMap = Map.fromIterable(actorList,
        key: (actor) => actor.id, value: (actor) => actor);
    await getActorBox().putAll(actorMap);
  }

  List<ActorVO> getAllActors() {
    List<ActorVO> actorList = getActorBox().values.toList();

    if (actorList.isNotEmpty) {
      return actorList;
    } else {
      return [];
    }
  }

  //Reactive
  Stream<void> getAllActorsEventStream() {
    return getActorBox().watch();
  }

  Stream<List<ActorVO>> getAllActorsStream() {
    return Stream.value(getAllActors());
  }

  Box<ActorVO> getActorBox() {
    return Hive.box<ActorVO>(BOX_NAME_ACTOR_VO);
  }
}
