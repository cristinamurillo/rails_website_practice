class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if params[:commit] == "Remove author"
      @book = Book.find(params[:author][:book_ids])
      @author.books.delete(@book)
      redirect_to book_path(@book)
      
    else 
      @author.update(author_params)

      if @author.valid?
        redirect_to author_path(@author)
      else
        render :edit
      end
    end 
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit(:name, :birth_year)
  end

end
