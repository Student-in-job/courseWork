/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base32;

/**
 *
 * @author ksinn
 */
public class generatePasswords extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int group_id;
        try {
            group_id = Integer.parseInt(request.getParameter("g"));
        } catch (Exception ex) {
            throw new ServletException("Error parameter!");
        }

        try {
            Collection<Student> list = DBHelper.getInstance().getStudents(group_id);
            HashMap<Student, String> pass = new HashMap<Student, String>();

            Iterator<Student> iterator = list.iterator();
            while (iterator.hasNext()) {
                Student s = iterator.next();
                pass.put(s, genPass(s));
            }
            request.setAttribute("list", pass);
            request.getRequestDispatcher("password_list.jsp").forward(request, response);
                    
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (NamingException ex) {
            throw new ServletException(ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String genPass(Student s) {

        byte[] buffer = new byte[5];

        // Filling the buffer with random numbers.
        // Notice: you want to reuse the same random generator
        // while generating larger random number sequences.
        new Random(Long.valueOf(String.valueOf(System.currentTimeMillis()) + String.valueOf(s.id))).nextBytes(buffer);

        // Getting the key and converting it to Base32
        Base32 codec = new Base32();
        byte[] bEncodedKey = codec.encode(buffer);
        String encodedKey = new String(bEncodedKey);
        return encodedKey;

    }

}
