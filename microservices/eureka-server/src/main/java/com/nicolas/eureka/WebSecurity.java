//package com.nicolas.eureka;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//import org.springframework.http.HttpMethod;
//
//import static org.springframework.security.config.Customizer.withDefaults;
//
//@EnableWebSecurity
//public class WebSecurity {
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//                .cors().and().csrf().disable()
//                .authorizeHttpRequests(a -> a
//                        .requestMatchers().permitAll()
//                        .anyRequest().authenticated()
//                )
//                .httpBasic(withDefaults());
//        return http.build();
//    }
//}
