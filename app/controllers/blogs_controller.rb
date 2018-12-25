class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit, :show, :destroy]

  def top
  end

  def index
    @blogs = Blog.all.order(updated_at: "DESC")
    
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    # ログイン中のユーザーの、blogを、build(new)する
    @blog = current_user.blogs.build(blog_params)

    # バリデーションが成功したら
    if @blog.save
      
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示する。
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画する。
      render 'new'
    end
  end

  def confirm
    # ログイン中のユーザーの、blogを、build(new)する
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end
  
  def show
    set_blog
    @user = User.find_by(id: @blog.user_id)
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
  end
  
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
  private
  
  def blog_params
  params.require(:blog).permit(:title, :content)
  end
  
  # idをキーとして値を取得するメソッド
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login_check
		unless logged_in?
			flash[:alert] = "ログインしてください"
			redirect_to new_session_path
		end
	end
end
