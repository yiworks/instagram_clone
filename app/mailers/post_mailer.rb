class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post

    mail to: post.user.email, subject: '送信完了メール'
  end
end
