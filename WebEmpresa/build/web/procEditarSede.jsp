<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.query.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="sede" scope="request" class="ORM.Sede"/>
<jsp:setProperty name="sede" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editar de sede</title>
    </head>
    <body>
        <%
            ORM.Sede sedeBean = (ORM.Sede) request.getAttribute("sede");
            if (sedeBean == null) {
        %>
        ERROR: no se proporcionaron datos de sede para crear.
        <%
        } else {
            Transaction t = null;
            Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
            
            try {
                t = s.beginTransaction();%>
                 
                <%=sedeBean.getIdSede()%>
                <%
                s.update(sedeBean);
                t.commit();
        %>
        editada la sede: [<%=sedeBean.getIdSede()%>] <%=sedeBean.getNomSede()%><br/>
        <a href="controlador">Volver</a>
        <%
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                    if (t != null) {
                        t.rollback();
                    }
                }
            }
        %>
    </body>
</html>
