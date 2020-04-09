class UserMailer < ApplicationMailer
  default from: "notify@lolconcepts.com"
  
  def notify(user)
    @users = User.all.where(:smsok => true).where.not(mobile: [nil,""],carrier_id: [nil]).where(:admin => true)
    @email_list = []
    @users.each do |s|
      email = s.smsAddress
      if email != ""
        @email_list << email
      end
    end
    @email_list = @email_list.uniq
    @subj = "Masterminds"
    mail(:bcc => @email_list, :subject => @subj, :body => "New Entry Uploaded by #{user}!")
  end

  # Send out a note to ALL students. Template:=> /views/user_mailer/email_blast.text.erb
  def email_blast(subject,message)
    @users = User.all.where(:smsok => true).where.not(mobile: [nil,""],carrier_id: [nil])
    @email_list = []
    @users.each do |s|
      email = s.smsAddress
      if email != ""
        @email_list << email
      end
    end
    @email_list = @email_list.uniq
    @subj = subject
    mail(:bcc => @email_list, :subject => @subj, :body => message)
  end

end