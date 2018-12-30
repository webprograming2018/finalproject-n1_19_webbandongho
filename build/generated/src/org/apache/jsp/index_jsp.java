package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Product;
import model.Cart;
import dao.ProductDAO;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Trang Chủ</title>\n");
      out.write("        <link  href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/flexslider.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js\"></script>\n");
      out.write("        <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js\"></script> \n");
      out.write("\n");
      out.write("        <script defer src=\"js/jquery.flexslider.js\"></script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            $(document).ready(function () {\n");
      out.write("                $('.flexslider').flexslider({\n");
      out.write("                    animation: \"slide\"\n");
      out.write("                });\n");
      out.write("\n");
      out.write("\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <style>\n");
      out.write("            @media screen and (max-width: 991px)   {\n");
      out.write("                .anhPrnoidung{\n");
      out.write("                    display: none;\n");
      out.write("\n");
      out.write("                }\n");
      out.write("                .anhPr {\n");
      out.write("                    height: 90%;\n");
      out.write("                }\n");
      out.write("                .anhPr img{\n");
      out.write("\n");
      out.write("                    height: 90%;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("        </style>\n");
      out.write("        <style>\n");
      out.write("            .dropbtn {\n");
      out.write("                font-family: \"Helvetica Neue\",Helvetica,Arial,sans-serif;       \n");
      out.write("                color: #777;\n");
      out.write("                padding: 0px;\n");
      out.write("                font-size: 18px;\n");
      out.write("                border: none;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown {\n");
      out.write("                position: relative;\n");
      out.write("                display: inline-block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-content {\n");
      out.write("                display: none;\n");
      out.write("                position: absolute;\n");
      out.write("                background-color: sandybrown;\n");
      out.write("                min-width: 160px;\n");
      out.write("                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-content a {\n");
      out.write("                color: black;\n");
      out.write("                padding: 12px 16px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .dropdown-content a:hover {background-color: #f1f1f1}\n");
      out.write("\n");
      out.write("            .dropdown:hover .dropdown-content {\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /*.dropdown:hover .dropbtn {\n");
      out.write("                background-color: white;\n");
      out.write("            }*/\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            ProductDAO productDAO = new ProductDAO();
            String category_id = "3";
            
            
            
//            if(request.getParameter("category")!=null){
//                category_id = request.getParameter("category");
//            }
//            Cart cart = (Cart) session.getAttribute("cart");
//            if(cart == null) {
//                cart = new Cart();
//                session.setAttribute("cart", cart); //gán sessoin; session.setAttribute(“string”, object)
//            }
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            <!----hình ảnh banner---->\n");
      out.write("            <div class=\"banner\">\n");
      out.write("                <div class=\"container-fluid\" style=\"padding-left: 0px; padding-right: 0px\" >\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-lg-12\" >\n");
      out.write("                            <div class=\"flexslider\" style=\"width: 100%; margin: 0\" >\n");
      out.write("                                <ul class=\"slides\">\n");
      out.write("                                    <li>\n");
      out.write("                                        <img src=\"images/bnr-1.jpg\">\n");
      out.write("                                        <p class=\"flex-caption\" style=\"text-align: center; font-size: 20px\">Thương hiệu</p>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li>\n");
      out.write("                                        <img src=\"images/bnr-2.jpg\"style=\"width: 100%\" height=\"100%\" />\n");
      out.write("                                        <p class=\"flex-caption\" style=\"text-align: center; font-size: 20px\">Đẳng cấp</p>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li>\n");
      out.write("                                        <img src=\"images/bnr-3.jpg\" style=\"width: 100%\" height=\"100%\"/>\n");
      out.write("                                        <p class=\"flex-caption \" style=\"text-align: center; font-size: 20px\">Sang trọng</p>\n");
      out.write("                                    </li>\n");
      out.write("\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!----kết thúc hình ảnh banner-------->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!----3 mục tiêu biểu ---->\n");
      out.write("        <div class=\"about\" >\n");
      out.write("            <div class=\"container\" style=\"margin-top: 50px\">\n");
      out.write("\n");
      out.write("                <div class=\"row\">\n");
      out.write("\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4\" >\n");
      out.write("                        <div  class=\"panel\">\n");
      out.write("                            <img  class=\"img-responsive\" src=\"images/abt-1.jpg\" style=\"width: 100%\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4\">\n");
      out.write("                        <div class=\"panel\"> \n");
      out.write("                            <img  class=\"img-responsive\" src=\"images/abt-2.jpg\" style=\"width: 100%\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4 \">\n");
      out.write("                        <div class=\"panel\">\n");
      out.write("                            <img  class=\"img-responsive\" src=\"images/abt-3.jpg\" style=\"width: 100%\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!----3 mục tiêu biểu---->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!----phần sản phẩm---->\n");
      out.write("        <div class=\"product\" >\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\" style=\"padding-top: 20px\">\n");
      out.write("                ");

                    for (Product p : productDAO.getListProductByCategory(Long.parseLong(category_id))) {
                
      out.write("\n");
      out.write("                <div  class=\"col-lg-3 col-md-6  col-sm-12 dichuyen\" style=\"height: 400px\">\n");
      out.write("                    <div class=\"khungchua\" >\n");
      out.write("                        <div  class=\"anhPr\">\n");
      out.write("                            <a href=single.jsp?productID=");
      out.print(p.getProductID());
      out.write(">      <img  class=\"img-responsive zoom-img\" src =\"");
      out.print(p.getProductImage());
      out.write("\"> </a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"anhPrnoidung\">\n");
      out.write("                            <h4>Smart Watches</h4>\n");
      out.write("                            <p>Explore Now</p>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"anhPrnoidung\">\n");
      out.write("                            <h4> <a href=\"CartServlet?command=plus&productID=");
      out.print(p.getProductID());
      out.write("\"> <img src=\"images/cart-2.png\" alt=\"hinh gio hang\"></img></a> $ ");
      out.print(p.getProductPrice());
      out.write("</h4>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("                <div class=\"clearfix\"></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
