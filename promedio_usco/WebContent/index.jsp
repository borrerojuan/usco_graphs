<%@ page import="java.sql.*"%>
<%@ page import="com.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<title>Gráficas Notas</title>
</head>
<body>

	<%
	
	DBConnection con = new DBConnection();
    Connection connect = con.get_connection();
	
    //Query
	Statement smt;
    ResultSet rs;
    smt = connect.createStatement();
    //String query="SELECT Estudiante.codigo, Estudiante.nombre, Estudiante.apellido, Materia.nombre, Materia.creditos, Materia.definitiva, Semestre.numSemestre FROM Semestre, Materia, Estudiante WHERE Semestre.Estudiante_idEstudiante = Estudiante.idEstudiante and Semestre.Materia_idMateria = Materia.idMateria and Semestre.numSemestre = Materia.numSemestre and Estudiante_idEstudiante = 1";
    String query="SELECT idEstudiante, numID, codigo, nombre, apellido, programa FROM Estudiante";
    rs = smt.executeQuery(query);
	%>
	
	<div class="container">
		<h1>Estudiante</h1>
		<hr>
		<table class="table table-bordered">
			<tr>
				<th class="text-center">ID</th>
				<th class="text-center">Cedula</th>
				<th class="text-center">Codigo</th>
				<th class="text-center">Nombre</th>
				<th class="text-center">Apellido</th>
				<th class="text-center">Programa</th>
				<th class="text-center">Gráficas</th>
			</tr>
			<% 
				while(rs.next()) {
			%>
			<tr>
				<td class="text-center"><%= rs.getInt("idEstudiante")%></td>
				<td class="text-center"><%= rs.getString("numID")%></td>
				<td class="text-center"><%= rs.getString("codigo")%></td>
				<td class="text-center"><%= rs.getString("nombre")%></td>
				<td class="text-center"><%= rs.getString("apellido")%></td>
				<td class="text-center"><%= rs.getString("programa")%></td>
				<td class="text-center">
					<a class="btn btn-warning btn-sm" href="materias.jsp">Ver Materias</a>
					<a class="btn btn-warning btn-sm" href="semestre.jsp">Ver Semestres</a>
				</td>				
			</tr>
			<%}%>
		</table>
	</div>

</body>
</html>








