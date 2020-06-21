<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="sede" scope="request" class="ORM.Sede"/>
<jsp:setProperty name="sede" property="*"/>

<%
    ORM.Sede sedeBean = (ORM.Sede) request.getAttribute("sede");
    if (sedeBean == null) {
%>
ERROR: no se especific&oacute; sede a mostrar.
<%
} else {
    Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
    try  {
        s.refresh(sedeBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar de Sede</title>
    </head>
    <body>
        <form method="post" action="controlador">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="op" value="procEditarSede"/>
                        <input type="hidden" name="idSede"  value="<%=sedeBean.getIdSede()%>"/>
                        <input name="nomSede" value="<%=sedeBean.getNomSede()%>"  required type="text" size="20" maxlength="20"/>              
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Crear"/>
                        <input type="reset" name="cancelar" value="Cancelar"/>
                    </td>
                </tr>
            </table>
        </form>
        <a href="controlador">Inicio</a>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>