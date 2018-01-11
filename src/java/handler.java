/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class handler extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Student s = (Student) request.getSession().getAttribute("student");
        if(s==null)
            response.sendRedirect("home");
        
        int theme_id;
        try{
            theme_id = Integer.parseInt(request.getParameter("t"));
        } catch(Exception ex){
            throw new ServletException("Error parameter!");
        }       
        
        Work w = new Work();
        w.theme = theme_id;
        w.student = s;
        try {
            if(DBHelper.getInstance().saveWork(w)){            
                response.sendRedirect("home?m=Your choice is accepted&l=s");                
            } else
                response.sendRedirect("themes?m=An error has occurred. Try again&l=s");
        } catch (SQLException ex) {
            throw new ServletException("Can not save data!");
        } catch (NamingException ex) {
            Logger.getLogger(handler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
