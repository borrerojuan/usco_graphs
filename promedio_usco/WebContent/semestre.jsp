<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.ui.ApplicationFrame"%>
<%@ page import="org.jfree.ui.RefineryUtilities"%>
<%@ page import="org.jfree.data.general.*"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semestres</title>
</head>
<body>

	<%
		
	DBConnection con = new DBConnection();
    Connection connect = con.get_connection();
	
	Statement smt;
    ResultSet rs;
    smt = connect.createStatement();
    
    String query="SELECT numSemestre, ponderado FROM Semestre";
    rs = smt.executeQuery(query);
	
		
	try{
		
		DefaultCategoryDataset data = new DefaultCategoryDataset();
		
		while(rs.next()){
			data.addValue(rs.getFloat("ponderado"), "", "Semestre " + rs.getString("numSemestre"));
			
		}
		
		JFreeChart graph = ChartFactory.createLineChart("Ponderado Semestres", "Semestre", "Ponderado", data, PlotOrientation.VERTICAL, true, true, false);
		
		response.setContentType("image/JPEG");
		OutputStream sa = response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(sa, graph, 640, 480);
				
	}catch(Exception ex){
		System.out.print(ex);
	}
	
	%>

</body>
</html>








