<%@page import="model.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
MemDAO dao = new MemDAO(application);
ArrayList<ReservationDTO> monthData = dao.monthData(); 

	//ArrayList<ReservationDTO> rDTO = new ArrayList<ReservationDTO>();
System.out.println("monthData.get(0).getResv_date()="+monthData.get(0).getResv_date());

	
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>verview-shart</title>
</head>
<body>
<script>

   
/*--------------  overview-chart start ------------*/
if ($('#verview-shart').length) {
    var myConfig = {
        "type": "line",

        "scale-x": { //X-Axis
            "labels": ["18/10", "18/11", "18/12", "19/01", "19/02", "19/03"],
            "label": {
                "font-size": 14,
                "offset-x": 0,
            },
            "item": { //Scale Items (scale values or labels)    
                "font-size": 10,
            },
            "guide": { //Guides
                "visible": false,
                "line-style": "solid", //"solid", "dotted", "dashed", "dashdot"    
                "alpha": 1
            }
        },
        "plot": { "aspect": "spline" },
        "series": [{
                "values": [<%=monthData.get(0).getResv_idx()%>,<%=monthData.get(0).getResv_hp_idx()%>,<%=monthData.get(0).getResv_mem_idx()%>,<%=monthData.get(0).getResv_symp()%>,<%=monthData.get(0).getResv_req()%>,<%=monthData.get(0).getResv_date()%>],
                "line-color": "#F0B41A",
                /* "dotted" | "dashed" */
                "line-width": 5 /* in pixels */ ,
                "marker": { /* Marker object */
                    "background-color": "#D79D3B",
                    /* hexadecimal or RGB value */
                    "size": 5,
                    /* in pixels */
                    "border-color": "#D79D3B",
                    /* hexadecimal or RBG value */
                }
            } 
        ]
    };

    zingchart.render({
        id: 'verview-shart',
        data: myConfig,
        height: "100%",
        width: "100%"
    });
}

/*--------------  overview-chart END ------------*/    
</script>
</body>
</html>