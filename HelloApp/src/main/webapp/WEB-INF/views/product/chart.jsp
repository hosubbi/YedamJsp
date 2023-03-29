<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      

      function drawChart() {
        // [{'Admin':1}, {'Accounting':2}.....]
		  fetch('chartAjax.do')
	      .then(resolve => resolve.json())
	      .then(result => {
	        let outAry = [];
	        outAry.push(['dept', 'cnt per dept']);
	        result.forEach(dept => {
	          let ary = []
	          for (prop in dept) {
	            ary[0] = prop;
	            ary[1] = dept[prop];
	          }
	          outAry.push(ary); // 가공.
	        })
	       	var data = google.visualization.arrayToDataTable(outAry);
		    var options = {
		        title: 'Person By Department'
		    };
		
		      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		      chart.draw(data, options);
		      
	        
	      })
	      .catch(reject => console.error(reject))

      }
    </script>
</head>
<body>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
</body>
</html>
