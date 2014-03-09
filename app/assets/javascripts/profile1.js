// var chart;
// var chartData = [];
// var chartCursor;

// AmCharts.ready(function () {
//     // generate some data first
//     // generateChartData();

//     // SERIAL CHART
//     chart = new AmCharts.AmSerialChart();
//     chart.pathToImages = "/assets/amcharts/images/";
//     chart.dataProvider = chartData;
//     chart.categoryField = "date";
//     chart.balloon.bulletSize = 5;
//     chart.dataDateFormat = "YYYY-MM-DD";

//     // listen for "dataUpdated" event (fired when chart is rendered) and call zoomChart method when it happens
//     chart.addListener("dataUpdated", zoomChart);

//     // AXES
//     // category
//     var categoryAxis = chart.categoryAxis;
//     categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
//     categoryAxis.minPeriod = "DD"; // our data is daily, so we set minPeriod to DD
//     categoryAxis.dashLength = 1;
//     categoryAxis.minorGridEnabled = true;
//     categoryAxis.position = "top";
//     categoryAxis.axisColor = "#DADADA";

//     // value
//     var valueAxis = new AmCharts.ValueAxis();
//     valueAxis.axisAlpha = 0;
//     valueAxis.dashLength = 1;
//     chart.addValueAxis(valueAxis);

//     // GRAPH
//     var graph = new AmCharts.AmGraph();
//     graph.title = "red line";
//     graph.valueField = "visits";
//     graph.bullet = "round";
//     graph.bulletBorderColor = "#FFFFFF";
//     graph.bulletBorderThickness = 2;
//     graph.bulletBorderAlpha = 1;
//     graph.lineThickness = 2;
//     graph.lineColor = "#5fb503";
//     graph.negativeLineColor = "#efcc26";
//     graph.hideBulletsCount = 50; // this makes the chart to hide bullets when there are more than 50 series in selection
//     chart.addGraph(graph);

//     // CURSOR
//     chartCursor = new AmCharts.ChartCursor();
//     chartCursor.cursorPosition = "mouse";
//     chartCursor.pan = true; // set it to fals if you want the cursor to work in "select" mode
//     chart.addChartCursor(chartCursor);

//     // SCROLLBAR
//     var chartScrollbar = new AmCharts.ChartScrollbar();
//     chart.addChartScrollbar(chartScrollbar);

//     chart.creditsPosition = "bottom-right";

//     loadCSV("/data/data1.txt");

//     // WRITE
//     chart.write("chartdiv");
// });

// generate some random data, quite different range
// function generateChartData() {
//     var firstDate = new Date();
//     firstDate.setDate(firstDate.getDate() - 500);

//     for (var i = 0; i < 500; i++) {
//         // we create date objects here. In your data, you can have date strings
//         // and then set format of your dates using chart.dataDateFormat property,
//         // however when possible, use date objects, as this will speed up chart rendering.
//         var newDate = new Date(firstDate);
//         newDate.setDate(newDate.getDate() + i);

//         var visits = Math.round(Math.random() * 40) - 20;

//         chartData.push({
//             date: newDate,
//             visits: visits
//         });
//     }
// }

// //load data
// function loadCSV(file) {
//     var request;
//     if (window.XMLHttpRequest) {
//         // IE7+, Firefox, Chrome, Opera, Safari
//         request = new XMLHttpRequest();
//     } else {
//         // code for IE6, IE5
//         request = new ActiveXObject('Microsoft.XMLHTTP');
//     }
//     // load
//     request.open('GET', file, false);
//     request.send();
//     parseCSV(request.responseText);
// }

// function parseCSV(data){
//  //   alert(data);
//     //replace UNIX new lines
//     data = data.replace (/\r\n/g, "\n");
//     //replace MAC new lines
//     data = data.replace (/\r/g, "\n");
//     //split into rows
//     var rows = data.split("\n");

//     // loop through all rows
//     for (var i = 0; i < rows.length; i++) {
//         // this line helps to skip empty rows
//         if (rows[i]) {
//             // our columns are separated by comma
//             var column = rows[i].split(",");

//             // column is array now 
//             // first item is date
//             var date = column[0];
//             // second item is value of the second column
//             var value = column[1];

//             // create object which contains all these items:
//             var dataObject = {
//                 date: date,
//                 visits: value
//             };
//             // add object to chartData array
//             chartData.push(dataObject);
//         }
//         chart.validateData();
//     }    
// }

// AmCharts.ready(function() {
//    // load the data
//    var chartData = AmCharts.loadJSON('/users/1/works.json');

//    // this is a temporary line to verify if the data is loaded and parsed correctly
//    // please note, that console.debug will work on Safari/Chrome only
//    console.debug(chartData);

//    // build the chart
//    // ...
//  });

var chart;

// create chart
AmCharts.ready(function() {

  // load the data
  var chartData = AmCharts.loadJSON('/profile_works.json');

  // SERIAL CHART    
  chart = new AmCharts.AmSerialChart();
  chart.pathToImages = "http://www.amcharts.com/lib/images/";
  chart.dataProvider = chartData;
  chart.categoryField = "created_at";
  chart.dataDateFormat = "YYYY-MM-DD";

  // GRAPHS

  var graph1 = new AmCharts.AmGraph();
  graph1.valueField = "mark";
  graph1.bullet = "round";
  graph1.bulletBorderColor = "#FFFFFF";
  graph1.bulletBorderThickness = 2;
  graph1.lineThickness = 2;
  graph1.lineAlpha = 0.5;
  chart.addGraph(graph1);

  // CATEGORY AXIS 
  chart.categoryAxis.parseDates = true;

  // WRITE
  chart.write("chartdiv");
});

AmCharts.loadJSON = function(url) {
  // create the request
  if (window.XMLHttpRequest) {
    // IE7+, Firefox, Chrome, Opera, Safari
    var request = new XMLHttpRequest();
  } else {
    // code for IE6, IE5
    var request = new ActiveXObject('Microsoft.XMLHTTP');
  }

  // load it
  // the last "false" parameter ensures that our code will wait before the
  // data is loaded
  request.open('GET', url, false);
  request.send();

  // parse adn return the output
  return eval(request.responseText);
};

// this method is called when chart is first inited as we listen for "dataUpdated" event
// function zoomChart() {
//     // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
//     chart.zoomToIndexes(chartData.length - 40, chartData.length - 1);
// }

// // changes cursor mode from pan to select
// function setPanSelect() {
//     if (document.getElementById("rb1").checked) {
//         chartCursor.pan = false;
//         chartCursor.zoomable = true;
//     } else {
//         chartCursor.pan = true;
//     }
//     chart.validateNow();
// }

