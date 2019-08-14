package com.zhiyou.config;

import java.util.Properties;

import org.springframework.boot.SpringBootConfiguration;
/**
 * 杩欐槸涓�涓厤缃被
 * @author 鏉庣埥
 *
 */
import org.springframework.context.annotation.Bean;

import com.github.pagehelper.PageHelper;
@SpringBootConfiguration
public class MyBatisConfig {
	
	@Bean
	public PageHelper pageHelper(){
		PageHelper p = new PageHelper();
		Properties properties = new Properties();
		properties.setProperty("offsetAspageNum", "true");
		properties.setProperty("rowBoundWithCount", "true");
		properties.setProperty("reasonable", "true");		
		p.setProperties(properties);
		return p;
	}

	
}
