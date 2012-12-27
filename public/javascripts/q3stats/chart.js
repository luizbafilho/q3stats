if(typeof Q3Stats === "undefined") {
  var Q3Stats = {};
}

Q3Stats.Chart = function() {

  var _init = function(){
    // Load the Visualization API and the piechart package.
    this.$chart = $("#chart");
    google.load('visualization', '1.0', {'packages':['corechart']});
  };

  var _drawGame = function(){
   // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Player');
    data.addColumn('number', 'Kills');
    data.addColumn('number', 'Deaths');

    $(Q3Stats.App.currentGame.players).each(function(index, player){
      data.addRow([player.name, player.kills, player.deaths]);
    });

    // Set chart options
    var options = {'title':"Kills and Deaths",
                   'width':400,
                   'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.BarChart(this.$chart[0]);
    chart.draw(data, options);
    $('<h3>').text('Statics graphic').prependTo(this.$chart);
    $('<hr>').appendTo(this.$chart);
  };

  var _drawRanking = function(){
   // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Player');
    data.addColumn('number', 'Kills');
    data.addColumn('number', 'Deaths');

    $(Q3Stats.Ranking.players).each(function(index, player){
      data.addRow([player.name, player.kills, player.deaths]);
    });

    // Set chart options
    var options = {'title':"Kills and Deaths",
                   'width':400,
                   'height':300};

    // Instantiate and draw our chart, passing in some options.
    var chart = new google.visualization.BarChart(this.$chart[0]);
    chart.draw(data, options);
    $('<h3>').text('Statics graphic').prependTo(this.$chart);
  };

  return{
    init: _init,
    drawGame: _drawGame,
    drawRanking: _drawRanking
  };
}();