if(typeof Q3Stats === "undefined") {
  var Q3Stats = {};
}

Q3Stats.Ranking = function(){
  
  var _init = function(players){
  	this.players = players

  	var src  = $("#row-template").html();

    this.$tbody = $('.table tbody')
    this.template =  Handlebars.compile(src);
  }

  var _render = function(){
  	var self = this;
  	$(self.players).each(function(index, player){
  		$(self.template(player)).appendTo(self.$tbody)
  	});
  }

  return{
    init: _init,
    render: _render
  } 

}();