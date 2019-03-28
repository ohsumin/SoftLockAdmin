<%@page import="java.util.List"%>
<%@page import="model.HospitalDTO"%>
<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
MemDAO dao = new MemDAO(application);

List<HospitalDTO> hpTypeNum = dao.getTypeNum();

String totalHpNum = dao.getTotalHpNum();
String totlaResvNum = dao.getTotalResvNum();

//System.out.println("totlaResvNum"+totlaResvNum);

%>    
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>총괄관리자 통계</title>
<script type="text/javascript">

	if ($('#ampiechart1').length) {
	    var chart = AmCharts.makeChart("ampiechart1", {
	        "type": "pie",
	        "labelRadius": -35,
	        "radius": 180,
	        "labelText": "[[percents]]%",
	        "dataProvider": [{
	            "hpType": "안과",
	            "litres": <%=hpTypeNum.get(0).getHp_typeCount()%>,
	            "backgroundColor": "#815DF6"
	        }, {
	            "hpType": "산부인과",
	            "litres": <%=hpTypeNum.get(1).getHp_typeCount()%>,
	            "backgroundColor": "#67B7DC"
	        }, {
	            "hpType": "피부과",
	            "litres": <%=hpTypeNum.get(2).getHp_typeCount()%>,
	            "backgroundColor": "#4D86BD"
	        }, {
	            "hpType": "치과",
	            "litres": <%=hpTypeNum.get(3).getHp_typeCount()%>,
	            "backgroundColor": "#FDD400"
	        }, {
	        	"hpType": "내과",
	            "litres": <%=hpTypeNum.get(4).getHp_typeCount()%>,
	            "backgroundColor": "#E36D67"
	        },{
	        	"hpType": "이비인후과",
	            "litres": <%=hpTypeNum.get(5).getHp_typeCount()%>,
	            "backgroundColor": "#0E487F"	
	        }],
	        "color": "#fff",
	        "colorField": "backgroundColor",
	        "valueField": "litres",
	        "titleField": "hpType"
	    });
	
}

</script>

</head>
<body>


</body>
</html>