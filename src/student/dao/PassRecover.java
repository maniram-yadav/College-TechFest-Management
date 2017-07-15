package student.dao;
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


public class PassRecover {
	 private static final String user=MailString.EMAIL;
	   private static final String password=MailString.PASSWORD;
	   private static final String host=MailString.HOST;
	   private static final String port=MailString.PORT;
	   private static final String subject="Yantragene Password Recovery";
	   static LoginDetail ld=new LoginDetail();
	   
	   public static String sendMail(StudentDetail sd) throws AddressException ,MessagingException, SQLException{
		   Properties ppt=new Properties();
		   ppt.put("mail.smtp.starttls.enable","true");
	       ppt.put("mail.smtp.host", host);
	       ppt.put("mail.smtp.user",user);
	       ppt.put("mail.smtp.password",password);
	       ppt.put("mail.smtp.port",port);
	       ppt.put("mail.smtp.auth","true");
	       int i=0;

	       try{
	       ld=new  StudentDao().recoverPassword(sd);   
	       if(ld.getPassword()==null||ld==null)
	       {
	    	   return "No user found with this email id";
	       
	       }
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

	           message.setText("Someone has been try to login your account and has been "
	           		+ " requested for password recovery. So this email has been sent to you. If you have not"
	           		+ " tried to do this then go to your YANTRAGENE profile and change your password.  Your password is :-- : "+ld.getPassword()+"");
	           Transport.send(message);

               return "A password link has been sent successfully. check your email id";
	        }
	       
	       catch (MessagingException mex) {
	    	   
	           return "Unable to fetch your email in database.";
	        }
	       
	       }
	       catch(Exception e){
	    	   System.out.println(e);
	    	   return "No user found with this email id";
	       }
	   }
	   }
