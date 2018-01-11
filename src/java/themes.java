/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ksinn
 */
public class themes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int subject_id = Integer.parseInt(request.getParameter("s"));
        Student s = (Student) request.getSession().getAttribute("student");
        if (s == null) {
            response.sendRedirect("home");
        }

        try {
            if (DBHelper.getInstance().checkStudent(1, s.id)) {
                int group_id = s.group_id;
                
                Collection themes = DBHelper.getInstance().getFreeThemes(subject_id, group_id);
                request.setAttribute("themes", themes);
                request.getSession().setAttribute("subject_id", subject_id);
                request.getRequestDispatcher("/themes.jsp").forward(request, response);
            } else {
                response.sendRedirect("home?m=You already have a theme&l=w");
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (NamingException ex) {
            throw new ServletException(ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
