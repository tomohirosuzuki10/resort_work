class PostsController < ApplicationController
    PER = 12
  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(PER)
# 投稿順(最新順)にデータを表示させるようにする
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
# 空のpostインスタンスを生成する
  end

  def edit
      @post = Post.find(params[:id])
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
      @post = Post.find(params[:id])
# 編集ページの送信ボタンから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
  if @post.update(post_params)
    redirect_to post_path, notice: "投稿を編集しました"
  else
    flash.now[:danger] = "編集に失敗しました"
    render 'edit'
  end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
# 削除リンクから飛んできたときのparamsに格納されたidを元に、該当する投稿データを探して、変数に代入する
  if @post.destroy
    redirect_to posts_path, notice: "アウトプットを削除しました"
  else
    flash.now[:danger] = "削除に失敗しました"
    render 'show'
  end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :post_content, post_images:[] )
  end
end
