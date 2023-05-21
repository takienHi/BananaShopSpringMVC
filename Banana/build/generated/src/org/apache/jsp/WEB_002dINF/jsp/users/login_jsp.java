package org.apache.jsp.WEB_002dINF.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/linkcss.jsp", out, false);
      out.write("\n");
      out.write("        </head>\n");
      out.write("        <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            <!-- Body main wrapper start -->\n");
      out.write("            <main>\n");
      out.write("                <!-- Breadcrumb-area-start -->\n");
      out.write("                <div class=\"breadcrumb-area pt-10 pb-10\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <div class=\"breadcrumb__list\">\n");
      out.write("                                    <span><a href=\"index.html\">Home</a></span>\n");
      out.write("                                    <span class=\"dvdr\"><i class=\"fa-regular fa-angle-right\"></i></span>\n");
      out.write("                                    <span>Login</span>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Breadcrumb-area-end -->\n");
      out.write("\n");
      out.write("                <!-- Register area start  -->\n");
      out.write("                <div class=\"bd-login__area pt-110 pb-130\">\n");
      out.write("                    <div class=\"container small-container\">\n");
      out.write("                        <div class=\"row justify-content-center\">\n");
      out.write("                            <div class=\"col-xl-8 col-lg-10\">\n");
      out.write("                                <div class=\"Login-form-wrapper\">\n");
      out.write("                                    <div class=\"bd-postbox__contact\">\n");
      out.write("                                        <form action=\"#\">\n");
      out.write("                                            <div class=\"row\">\n");
      out.write("                                                <div class=\"col-xxl-12\">\n");
      out.write("                                                    <div class=\"bd-postbox__singel-input\">\n");
      out.write("                                                        <input type=\"text\" placeholder=\"Email or UserName\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"col-xxl-12\">\n");
      out.write("                                                    <div class=\"bd-postbox__singel-input\">\n");
      out.write("                                                        <input type=\"text\" placeholder=\"Password\">\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"signup-action\">\n");
      out.write("                                                    <div class=\"signup-action-check\">\n");
      out.write("                                                        <input class=\"e-check-input\" type=\"checkbox\" id=\"sing-up\">\n");
      out.write("                                                        <label class=\"sign-check\" for=\"sing-up\"><span>Remember me</span></label>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"bd-sigin__action-button mb-20\">\n");
      out.write("                                                    <button class=\"bd-fill__btn w-100\">Login now</button>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"bd-registered__wrapper\">\n");
      out.write("                                                    <div class=\"not-register\">\n");
      out.write("                                                        <span>Not registered?</span><span><a href=\"register.html\"> Sign up</a></span>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"forget-password\">\n");
      out.write("                                                        <a href=\"#\">Forgot password?</a>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                                <div class=\"bd-resister__bottom-text text-center\">\n");
      out.write("                                                    <div class=\"bd-sign__social-text\">\n");
      out.write("                                                        <span>Or Sign- in with</span>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <div class=\"bd-sign__social-icon\">\n");
      out.write("                                                        <a href=\"https://www.facebook.com/\">\n");
      out.write("                                                            <i class=\"fa-brands fa-facebook-f\"></i>\n");
      out.write("                                                            <span>Facebook</span>\n");
      out.write("                                                        </a>\n");
      out.write("                                                        <a href=\"https://www.gmail.com/\">\n");
      out.write("                                                            <i class=\"fa-solid fa-envelope-open\"></i>\n");
      out.write("                                                            <span>Google</span>\n");
      out.write("                                                        </a>\n");
      out.write("                                                    </div>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Register area end  -->\n");
      out.write("            </main>\n");
      out.write("            <!-- Body main wrapper ebd -->\n");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "layout/footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
