/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class SendMail {

    public void send(String to, String subject, String body) {
        final String username = "mq2587171@gmail.com";
        final String password = "snjx jeyw ofkb ipcu";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
		// Tạo một tin nhắn
		MimeMessage msg = new MimeMessage(session);

		try {
			// Người gửi
			msg.setFrom(new InternetAddress(username));

			// Người nhận
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

			// Tiêu đề email
			msg.setSubject(subject,"UTF-8");

			// Nội dung
			msg.setContent(body, "text/HTML; charset=UTF-8");

			// Gửi email
			Transport.send(msg);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
