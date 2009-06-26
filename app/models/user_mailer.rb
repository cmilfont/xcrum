class UserMailer < ActionMailer::Base

	def contact(sender = "igocoelho@gmail.com", subject="teste")
		recipients ["igocoelho@gmail.com", "cmilfont@gmail.com", "elite-ce@googlegroups.com"]
		from "cmilfont@gmail.com"
		subject "Teste de submissão de email com o rails"
		sent_on Time.now
		body({:user => "igocoelho@gmail.com",:url => "http://example.com/login"})
	end

end

