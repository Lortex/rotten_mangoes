class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:search]
      @movies = Movie.search(params[:search]).order('title ASC')
    else
      @movies = Movie.all.order('title ASC')
    end
  end

  #i want to DRY this up
  def show
    @movies = Movie.where(id: params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
       :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image
    )
  end


end
