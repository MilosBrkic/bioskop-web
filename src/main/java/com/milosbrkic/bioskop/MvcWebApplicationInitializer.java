/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop;

import com.milosbrkic.bioskop.config.SecurityConfig;
import com.milosbrkic.bioskop.config.WebContextConfig;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 *
 * @author milos
 */
public class MvcWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { WebContextConfig.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        //return new Class[] {WebContextConfig.class} ;
        return null;
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }
    
}
