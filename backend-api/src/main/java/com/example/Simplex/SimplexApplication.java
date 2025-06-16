package com.example.Simplex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class SimplexApplication implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(SimplexApplication.class, args);
	}

}
