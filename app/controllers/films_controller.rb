class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  
  filter_resource_access

  # GET /films
  def index
    @films = Film.all
  end
  
  # GET /films/1
  def show
  end
  
  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      # params.fetch(:film, {})
      params.require(:film).permit(:name,
                                   :format_web,
                                   :format_dvd,
                                   :format_vhs,
                                   :format_blu,
                                   :country,
                                   :runtime,
                                   :notes,
                                   :release_year,
                                   :user_id,
                                   :draft,
                                   :locked,
                                   :image)
    end
end