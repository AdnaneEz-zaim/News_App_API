abstract class NewsStates {}
class NewsInitialStates extends NewsStates {}
class NewsBottomNaveStates extends NewsStates {}
class NewsThemeModeStates extends NewsStates {}

class NewsLadingDataStates extends NewsStates {}

class NewsGetBusinessDataStates extends NewsStates {}
class NewsGetBusinessDataErrorStates extends NewsStates {
   final String error;
  NewsGetBusinessDataErrorStates(this.error);
}

class NewsGetSportsDataStates extends NewsStates {}
class NewsGetSportsDataErrorStates extends NewsStates {
  final String error;
  NewsGetSportsDataErrorStates(this.error);
}

class NewsGetScienceDataStates extends NewsStates {}
class NewsGetScienceDataErrorStates extends NewsStates {
  final String error;
  NewsGetScienceDataErrorStates(this.error);
}

class NewsGetSearchDataStates extends NewsStates {}
class NewsGetSearchDataErrorStates extends NewsStates {
  final String error;
  NewsGetSearchDataErrorStates(this.error);
}