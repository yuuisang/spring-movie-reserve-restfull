package com.goldspoon.koreabox.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender  {
    
    @Autowired
    protected JavaMailSender mailSender;
    private String from = "koreaBoxS2@gmail.com";
    
    
    public void SendEmail(Email email) throws Exception {
         
    	
    	
        MimeMessage msg = mailSender.createMimeMessage();
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            msg.setFrom(from);  //보낸사람
           
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
            System.out.println("Mail보내기");
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }
    
 

    
}



