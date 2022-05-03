package com.induk.bucketlist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class BucketlistApplication {

	public static void main(String[] args) {
		SpringApplication.run(BucketlistApplication.class, args);
	}

}
