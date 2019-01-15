class PeopleController < ApplicationController
    before_action :set_person, only: [:show]

    def index
      if params[:letter].blank?
        @pagy_az, @people = pagy(Person.order(:name), page_param: :page_az, params: { active_tab: 'az' })
      elsif params[:letter] == '#'
        @pagy_az, @people = pagy(Person.order(:name).where("name REGEXP ?", 
        "^[^a-z]").order('name'), page_param: :page_az, params: { active_tab: 'az' })
      else
        @pagy_az, @people = pagy(Person.order(:name).where("name like ?",
        "#{params[:letter]}%").order('name'), page_param: :page_az, params: { active_tab: 'az' })
      end
    end

    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:film).permit(:name)
    end

end