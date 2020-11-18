package com.spring.homework.week05.springframework.common;

import com.spring.homework.week05.springframework.po.Staff;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

/**
 * <p>
 *
 * </p>
 *
 * @author
 * @since
 */
@ComponentScan(value = "com.spring.homework.week05.springframework.po")
public class BeanConfig {

    @Bean(value = "staff01")
    public Staff createStaff() {
        return new Staff();
    }
}
