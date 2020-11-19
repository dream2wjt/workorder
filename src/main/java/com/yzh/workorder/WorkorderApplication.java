package com.yzh.workorder;

//import org.mybatis.spring.annotation.MapperScan;
import com.spring4all.swagger.EnableSwagger2Doc;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@EnableSwagger2Doc
@SpringBootApplication
public class WorkorderApplication {

	public static void main(String[] args) {
		SpringApplication.run(WorkorderApplication.class, args);
	}

}
