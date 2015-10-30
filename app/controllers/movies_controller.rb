class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.where("title LIKE ?", "%#{params[:search_title]}%") if params[:search_title]
    @movies = @movies.where("director LIKE ?", "%#{params[:search_director]}%") if params[:search_director]
    @movies = @movies.where(runtime_in_minutes: 0..90) if (params[:search_runtime] && params[:search_runtime] == 'short')
    @movies = @movies.where(runtime_in_minutes: 90..120) if (params[:search_runtime] && params[:search_runtime] == 'medium')
    @movies = @movies.where("runtime_in_minutes > 120") if (params[:search_runtime] && params[:search_runtime] == 'long')
    @movies = @movies.order('title ASC')
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
      redirect_to movie_path(@movie), notice: "#{@movie.title} was updated successfully!"
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
