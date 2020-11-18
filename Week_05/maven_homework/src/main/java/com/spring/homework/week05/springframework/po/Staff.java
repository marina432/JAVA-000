package com.spring.homework.week05.springframework.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Component;

/**
 * <p>
 *
 * </p>
 *
 * @author
 * @since
 */
@Data
@ToString
@Component(value = "staff")
@NoArgsConstructor
@AllArgsConstructor
public class Staff {
    private Long id;
    private String name;
    private Integer age;
}
