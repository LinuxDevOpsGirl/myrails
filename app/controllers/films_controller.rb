class FilmsController < ApplicationController
  before_action :set_film, only: [:show]
  
  # GET /films
  def index
    @films = Film.all

    render json: @films
  end
  
  # GET /films/1
  def show    
    # @film, :except => [:company_id, :created_at, :updated_at],
#                         :include => [:people_filmers,
#                                      :people_editors,
#                                      :film_companies => {:except => [:created_at, :updated_at, :logo_updated_at]},
#                                      :sections => {:except => [:created_at, :updated_at],
#                                                    :include =>
#                                                            [:people_riders,
#                                                             :section_songs => {:except => [:created_at, :updated_at]}]
#                                                    }]
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_params
      params.fetch(:film, {})
    end
end