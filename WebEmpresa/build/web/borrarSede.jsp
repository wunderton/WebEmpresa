<%-- 
    Document   : borrarSede
    Created on : 11-may-2020, 0:27:01
    Author     : cuvil
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="org.hibernate.Query"%> 
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="org.hibernate.Query"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="sede" scope="request" class="ORM.Sede"/>
<jsp:setProperty name="name" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Borrado de la Sede </title> 
	</head> 
	<body> 
            <%
                Enumeration x = request.getParameterNames();
            %>
		<% 
			ORM.Sede nombre = (ORM.Sede) request.getAttribute("name"); 
			if (nombre == null) { 
		%> 
			ERROR: no se proporcionaron datos del Sede para borrar.
		<% } 
			else { 
				Transaction t = null; 
				try { 
                                        Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
					t = s.beginTransaction(); 
                                        s.delete(nombre);
					t.commit(); 
					%>
					Sede borrado: [<%=nombre.getIdSede()%>] <%=nombre.getDepartamentos()%><br/> 
					<a href="controlador">Volver</a> 
				<% } 
				catch (Exception e) { 
				e.printStackTrace(System.err); 
				if (t != null) { 
					t.rollback(); 
				}
			} 
		} %> 
	</body> 
</html>  