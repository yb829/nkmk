package com.kh.mvc.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


@WebFilter(filterName="encodingFilter", urlPatterns="/*")
public class encodingFilter implements Filter {

    
    public encodingFilter() {
        
    }

    public void init(FilterConfig fConfig) throws ServletException {
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		
		if(httpServletRequest.getMethod().equals("POST")) {
			request.setCharacterEncoding("UTF-8");
		}
		
		chain.doFilter(request, response);
	}

	public void destroy() {
		
	}

}
