part of 'match_bloc.dart';

abstract class MatchState {
  MatchModel match;

  MatchState(this.match);

  GameModel get currentGame => match.games.last;
}

class MatchStateOngoing extends MatchState {

  MatchStateOngoing(MatchModel match) : super(match);
}