<%-- 
    Document   : conec
    Created on : 27/09/2013, 11:21:44 PM
    Author     : Ludwin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" 
        import="java.sql.Connection"
        import="java.sql.DriverManager"
        import="java.sql.ResultSet"
        import="java.sql.Statement"
        import="java.sql.SQLException"
        %>
<%
        Connection conex=null;
        Statement sql=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            conex=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/hola","root","");
            sql=conex.createStatement();
            //out.print("Bien...!!");
            String user=request.getParameter("nombre");
            String pass=request.getParameter("pass");
            
            String qry="";
            if(user!=null && pass!=null)
            {
                //out.println(user+" "+pass);
                qry="insert into usuario(nombre, pass) values('"+user+"',  UNHEX(md5('"+pass+"')))";
                //qry="select * from usuario";
                sql.executeUpdate(qry);
                out.println("usuario registrado");	
            }
        }catch(Exception e)
        {
            out.print("Error de conexion");
        }
 %>