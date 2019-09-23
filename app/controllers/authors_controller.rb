class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.new(author_params) #creates the form but does not saves it

    if @author.valid? #checks for validation
      @author.save #if valid - saves
      redirect_to author_path(@author) #and redirects
    else
      render :new #else renders a new form 
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
