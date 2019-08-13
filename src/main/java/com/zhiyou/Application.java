package com.zhiyou;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//用来标识SpringBoot的启动类  是一个组合注解，除了包括java4大元注解 还包括以下
/**
 * @SpringBootConfiguration:  修饰在类上，用来标识这个类是一个xml配置类 一般与@bean结合使用
 * @bean: 注解用来修饰在方法上，该方法的返回值将会被注册到Spring容器中
 * @EnableAutoConfiguration:  自动装配Spring上下文，可以猜测和配置我们想要的bean类型
 * @ComponentScan:会自动扫描指定包下的componen,controller等注解并自动注入到ioc容器中,如果不指定路径,默认扫描自己所在包路径及所有子包
 * @author ls
 * */
//@ComponentScan("com.zhiyou")  //自定义需要扫描的路径
@SpringBootApplication
public class Application {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}
