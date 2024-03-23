class BooksController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
    
    
    params.require(:list).permit(:title, :body, :image)
    
    
  end
end
