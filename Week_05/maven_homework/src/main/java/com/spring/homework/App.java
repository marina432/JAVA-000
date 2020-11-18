package com.spring.homework;

import com.spring.homework.week05.springframework.common.BeanConfig;
import com.spring.homework.week05.springframework.po.Staff;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Hello world!
 *
 */
public class App
{
    public static void main( String[] args )
    {
        ApplicationContext annotationContext = new AnnotationConfigApplicationContext(BeanConfig.class);
        Staff staff = (Staff) annotationContext.getBean("staff");   //单例
        System.out.println(init(staff).toString());

        Staff staff01 = (Staff) annotationContext.getBean("staff01");       //多例
        System.out.println(init(staff01).toString());

        ApplicationContext xmlContext = new ClassPathXmlApplicationContext("application.xml");
        Staff staff02 = (Staff) xmlContext.getBean("staff02");      //多例，setter注入
        System.out.println(staff02.toString());

        Staff staff03 = (Staff) xmlContext.getBean("staff03");      //多例，构造方法注入
        System.out.println(staff03.toString());
    }

    private static Staff init(Staff staff) {
        staff.setId(101L);
        staff.setName("A");
        staff.setAge(20);
        return staff;
    }
}
