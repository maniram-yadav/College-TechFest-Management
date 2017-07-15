package student.controller;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import org.value.*;

import student.bean.LoginDetail;
import student.bean.StudentDetail;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class WelcomeMessage {
	
	 private static final String user=MailString.EMAIL;
	   private static final String password=MailString.PASSWORD;
	   private static final String host=MailString.HOST;
	   private static final String port=MailString.PORT;
	   private static final String subject="Welcome to YANTRAGENE-2k17";
	   static LoginDetail ld=new LoginDetail();
	   
	   public static void sendWelcome(StudentDetail sd) throws AddressException ,MessagingException, SQLException{
		   Properties ppt=new Properties();
		   ppt.put("mail.smtp.starttls.enable","true");
	       ppt.put("mail.smtp.host", host);
	       ppt.put("mail.smtp.user",user);
	       ppt.put("mail.smtp.password",password);
	       ppt.put("mail.smtp.port",port);
	       ppt.put("mail.smtp.auth","true");
	       int i=0;

	       Authenticator auth = new Authenticator() {
	           public PasswordAuthentication getPasswordAuthentication() {
	               return new PasswordAuthentication(user,password);
	           }
	       };

	       Session session = Session.getInstance(ppt,auth);

	       try {
	           MimeMessage message = new MimeMessage(session);

	           message.setFrom(new InternetAddress(user));
	           message.addRecipient(Message.RecipientType.TO, new InternetAddress(sd.getEmail()));
	           message.setSentDate(new Date());
	           message.setSubject(subject);

	           message.setText("Hi "+sd.getFirstname()+" "+sd.getLastname()+" , \n Congratulation you "
	           		+ "have been successfully registered to Yantragene 2k17 portal. Now you can participate in events organised by FGIET in YANTRAGENE 2k17. Go to portal and Login to your account and set up event participation.");
	           Transport.send(message);

                }
	       
	       catch (MessagingException mex) {
	    	   
                    	           }
	   }
	   }
