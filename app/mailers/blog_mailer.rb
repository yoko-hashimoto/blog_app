class BlogMailer < ApplicationMailer
  def blog_mail(blog)
    @blog = blog
   
    # mail to: "yoko.hashimoto.29@gmail.com", subject: "blog投稿確認メール"

    mail to: "#{@blog.user.email}", subject: "ブログ投稿の確認メール"

  end
end