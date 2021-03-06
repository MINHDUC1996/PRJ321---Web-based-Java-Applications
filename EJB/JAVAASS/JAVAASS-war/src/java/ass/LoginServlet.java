/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass;

import ass.account.AccountSessionBeanLocal;
import ass.account.AccountSessionBeanRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.ENV;

/**
 *
 * @author duclt
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Date currDate = new Date();        
        Integer timeLoginFailed = (Integer) session.getAttribute("LOGINFAILED");

        String url = ENV.PAGE_ERRORLOGIN;
        
        try {
            String username = request.getParameter("txtUsername").trim();
            String password = request.getParameter("txtPassword");

            Context context = new InitialContext();
            Object obj = context.lookup("AccountJNDI");
            AccountSessionBeanRemote poji = (AccountSessionBeanRemote) obj;
            
            if (poji.checkLogin(username, password)) {
                session.setAttribute("USER", username);                
                session.setAttribute("LOGINFAILED", null);
                session.setAttribute("DATESESSION", null);
                
                url = ENV.PAGE_TRANSACTION;                
            } else {
                if (timeLoginFailed == null) {
                    timeLoginFailed = 1;
                } else {
                    timeLoginFailed = timeLoginFailed + 1;
                }
                session.setAttribute("LOGINFAILED", timeLoginFailed);
                session.setAttribute("DATESESSION", currDate);
                
                url = ENV.PAGE_ERRORLOGIN;                
            }
        } catch (NamingException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
