package com.narendra;
import org.springframework.context.annotation.Configuration



@Configuration
@ComponentScan(basePackages="com.narendra")
@EnableWebMvc
public class SpringWebConfig {
	public ViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver("/jsp/",".jsp");
		return viewResolver;
	}

}
