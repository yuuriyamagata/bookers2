class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def destroy
    @book = Book.find(params[:id]) 
    @book.destroy 
    redirect_to books_path
  end
  
  def new
    @book = Book.new
  end

  def index
    @books=Book.all  
    @book=Book.new
    @users=User.all  
    @user=current_user
    # byebug
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      
      flash[:notice] ="Book was successfully created."
      # 4. トップ画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books=Book.all 
      @users=User.all  
      @user=current_user
      render :index
    end
  end
  
  def edit
    @book=Book.find(params[:id])
    
  end
 
  def show
    @book_new=Book.new
    @book=Book.find(params[:id]) 
    @user=@book.user
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
  
end
