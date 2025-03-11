package com.example.coding.domain;

public class TouroMateChatVO {
    public int chat_num;        // 채팅방(여행친구찾기) 번호
    public int touro_mate_num;  // 여행친구찾기번호
    public String user_id;
    public int touro_mate_count;
    public int chat_in_out;

    
    public int getChat_num() {
        return chat_num;
    }
    public void setChat_num(int chat_num) {
        this.chat_num = chat_num;
    }
    public int getTouro_mate_num() {
        return touro_mate_num;
    }
    public void setTouro_mate_num(int touro_mate_num) {
        this.touro_mate_num = touro_mate_num;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public int getTouro_mate_count() {
        return touro_mate_count;
    }
    public void setTouro_mate_count(int touro_mate_count) {
        this.touro_mate_count = touro_mate_count;
    }
    public int getChat_in_out() {
        return chat_in_out;
    }
    public void setChat_in_out(int chat_in_out) {
        this.chat_in_out = chat_in_out;
    }
    
}
