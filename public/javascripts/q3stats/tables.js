if(typeof Q3Stats === "undefined") {
  var Q3Stats = {};
}

Q3Stats.Tables = function(){

  var _init = function(){
    var src  = $("#game-template").html();

    this.$games = $('#games');
    this.template =  Handlebars.compile(src);
  }

  var _render = function(index){
    Q3Stats.App.setCurrentGame(index);
    this.$games.html(this.template(Q3Stats.App.games[index]));
    
    Q3Stats.Chart.draw();
  }

  var _renderAll = function() {
    var self = this;
    var rendered = null;
    Q3Stats.Chart.$chart.html('');
    self.$games.html('');
    $(Q3Stats.App.games).each(function(index, game){
      game.id = index;
      rendered = self.template(game)
      $(rendered).appendTo(self.$games)
    });
  }

  return {
    render: _render,
    renderAll: _renderAll,
    init: _init 
  }
}();