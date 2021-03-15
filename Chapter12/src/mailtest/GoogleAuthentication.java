package mailtest;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator{
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth=new PasswordAuthentication("ehddn4182@gmail.com", "ficfxmojhyqiyran");
		
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}

}
