<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String endDate=request.getParameter("endDate");
String beginDate=request.getParameter("beginDate");
System.out.println(beginDate+"\t"+endDate);
%>
<!-- <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["오사카", 2, "#b87333"],
        ["도쿄", 3, "silver"],
        ["일본", 4, "gold"],
        ["미국", 5, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "예약 현황(오늘)",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
  </script>
  
  <div id="barchart_values" style="width: 900px; height: 300px;"></div>
  <button id="exportReview">자료내보내기(여행후기)</button> -->