part of 'match_bloc.dart';

abstract class MatchState {
  MatchModel match;

  MatchState(this.match);

  GameModel get currentGame => match.games.last;
  double get xPoints => match.points[Player.x] ?? 0;
  double get oPoints => match.points[Player.o] ?? 0;
}

class MatchStateOngoing extends MatchState {
  MatchStateOngoing(MatchModel match) : super(match);
}

class MatchStateNewGame extends MatchState {
  MatchStateNewGame(MatchModel match) : super(match);
}

class MatchStateGameFinished extends MatchState {
  MatchStateGameFinished(MatchModel match) : super(match);
}
