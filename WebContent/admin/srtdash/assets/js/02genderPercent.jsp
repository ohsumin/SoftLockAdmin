<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
MemDAO dao = new MemDAO(application);

//전체 명수
int getTotalRecordCount = dao.getTotalRecordCount1();
System.out.println("getTotalRecordCount="+getTotalRecordCount);

//남자 인원수
int getGenderRecordCOunt = dao.getGenderRecordCount();  
System.out.println("getGenderRecordCOunt="+getGenderRecordCOunt);

//여자 = 전체 - 남자
int womanCount = getTotalRecordCount - getGenderRecordCOunt;
System.out.println("womanCount="+womanCount);
%>   
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>총괄관리자 통계(전체 일반회원중 남녀 비율)</title>
<script>
/*-------------- 2 Pie chart amchart start ------------*/      
if ($('#ampiechart2').length) {
    var chart = AmCharts.makeChart("ampiechart2", {
        "type": "pie",
        "theme": "light",
        "labelRadius": -65,
        "radius": 180,
        "labelText": "[[title]]",
        "dataProvider": [{
            "title": "Man",
            "value": <%=getGenderRecordCOunt%>
        }, {
            "title": "Woman",
            "value": <%=womanCount%>
        }],
        "titleField": "title",
        "valueField": "value",
        "export": {
            "enabled": false
        },
        "color": "#fff"
    });
}
/*-------------- 2 Pie chart amchart end ------------*/     
</script> 

</head>
<body>
