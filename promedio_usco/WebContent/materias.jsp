<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.db.DBConnection"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.data.general.*"%>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Materias</title>
</head>
<body>

	<%
		
	DBConnection con = new DBConnection();
    Connection connect = con.get_connection();
	
	Statement smt;
    ResultSet rs;
    smt = connect.createStatement();
    
    String query="SELECT nombre, definitiva, numSemestre FROM Materia";
    rs = smt.executeQuery(query);
	
		
	try{
		
		DefaultCategoryDataset data = new DefaultCategoryDataset();
		
		while(rs.next()){
			data.setValue(rs.getFloat("definitiva"), rs.getString("nombre"), "");
							
		}
		
		JFreeChart graph = ChartFactory.createBarChart("Materias vs Definitiva", "Materias", "Definitiva", data, PlotOrientation.VERTICAL, true, true, true);
		
		response.setContentType("image/JPEG");
		OutputStream sa = response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(sa, graph, 800, 800);
		
	}catch(Exception ex){
		System.out.print(ex);
	}
	
	%>

</body>
</html>








