if(typeof Q3Stats === "undefined") {
  var Q3Stats = {};
}

Q3Stats.Filter = function(){
  var _setupChange = function(){
   $('#filter').change(function(){
        if(this.value == -1){
            Q3Stats.GamesTables.renderAll();
        }else{
            Q3Stats.GamesTables.render(this.value);
        }
    });
  };

  var _loadGames = function(){
    var self = this;
    self.$filter = $('#filter');
    $(Q3Stats.App.games).each(function(index, game){
      $('<option>').text('Game ' + index).attr('value', index).appendTo(self.$filter);
    });
  };

  return{
    loadGames: _loadGames,
    setupChange: _setupChange
  };

}();