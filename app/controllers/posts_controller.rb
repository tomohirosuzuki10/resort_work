class PostsController < ApplicationController
    PER = 12
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(PER)
# 投稿順(最新順)にデータを表示させるようにする
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
# 空のpostインスタンスを生成する
  end

  def edit
  end

  def create
   @post = Post.new(post_params)
# newページで入力した内容が格納された状態のインスタンスが飛んでくる
   @post.user_id = current_user.id
# user_idカラムにcurrent_userのidを代入する
   if @post.save
    redirect_to posts_path
   else
    render 'new'
   end
  end
  
  

  def update
  end

  def destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :post_content)
  end
end
