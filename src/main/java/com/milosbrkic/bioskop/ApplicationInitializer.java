package com.milosbrkic.bioskop;

import com.milosbrkic.bioskop.config.WebContextConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;


//podesavanje dispecher servleta
public class ApplicationInitializer /*implements WebApplicationInitializer*/ {

	/*@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
	
            //spring kontenjer
            AnnotationConfigWebApplicationContext webApplicationContext = new AnnotationConfigWebApplicationContext();
            webApplicationContext.register(WebContextConfig.class);//klasa u kojoj se definisu binovi koji se nalaze u web kontekstu
            webApplicationContext.setServletContext(servletContext);

            ServletRegistration.Dynamic dispatcherServlet = servletContext.addServlet("mySpringDispatcherServlet", new DispatcherServlet(webApplicationContext));
            dispatcherServlet.addMapping("/");
            dispatcherServlet.setLoadOnStartup(1);
	}*/
             
}
