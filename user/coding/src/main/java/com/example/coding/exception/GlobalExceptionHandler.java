package com.example.coding.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.Map;

/*
에러로 인해 해결되지 않으면 트래픽이 쌓이기에
트래픽이 쌓이지 않기위해 모든 에러시 main 으로 return
에러 내용은 log 찍어 에러 확인 ->  수정
 */

@ControllerAdvice
public class GlobalExceptionHandler  {

    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class) ;

    private ResponseEntity<Map<String,Object>> emptySuccess(){
        return ResponseEntity.ok().build() ;
    }

    @ExceptionHandler(Exception.class)
    public String handleAllException(Exception ex){
        log.error("handleAllException : ",ex);
        return "/Touro" ;
    }

}
