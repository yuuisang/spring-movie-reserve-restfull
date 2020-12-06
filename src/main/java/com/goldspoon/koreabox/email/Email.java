package com.goldspoon.koreabox.email;

public class Email {
	 
    private String subject;  //메일 제목
    private String content;	 //메일 내용
    private String receiver; //받는사람 정보
    private String from; //받는사람 정보
     
    public String getReceiver() {
        return receiver;
    }
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
 
    public String getSubject() {
        return subject;
    }
    public String getFrom() {
    	return from;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}
