class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_Pic.subject
  #
  def sendmail_pic(pic)
   @pic = pic

    mail to: "dive154@dc1.test154.etius.jp",
         subject: '【インスタ】写真が投稿されました'
  end
end
