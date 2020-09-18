class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
    # binding.pry
    # raise
  end
  def new
    @blog = Blog.new
  end
  def create
    # Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # Blog.create(params[:blog])←セキュリティーの問題でエラーが発生するので、下記のようにストロングパラメータを使う
    # Blog.create(params.require(:blog).permit(:title, :content))
    # Blog.create(blog_params)
    # redirect_to "/blogs/new"
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end
  def show
    # idを利用してデータを取得する場合は、findメソッドを使う。パラメーターには、idの情報しか送られないため。（title,contentの情報は載っていない）
    # @blog = Blog.find(params[:id])
  end
  def edit
    # @blog = Blog.find(params[:id])
  end
  def update
    # @blog = Blog.find(params[:id])
    # updateに引数(parametersで参照したもの）を与えると、その引数の値で更新できます。
    if @blog.update(blog_params)
      redirect_to blogs_path ,notice: "ブログを更新しました！"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
