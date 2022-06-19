package com.xumi.provider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.xumi.provider.model.ItemManager;

@SpringBootApplication
public class XumiProviderApplication {

    public static void main(String[] args) {
    	ItemManager.getInstance().load();
        SpringApplication.run(XumiProviderApplication.class, args);
    }

}
