if(typeof Q3Stats === "undefined") {
  var Q3Stats = {};
}

Q3Stats.App = function(){

  var _init = function(games){
    this.games = games;
  };

  var _setCurrentGame = function(index){
    this.currentGame = this.games[index];
  };

  return {
    init: _init,
    setCurrentGame: _setCurrentGame
  };

}();