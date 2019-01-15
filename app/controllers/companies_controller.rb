class CompaniesController < ApplicationController
    before_action :set_company, only: [:show]

    def index
        if params[:letter].blank?
            @pagy_az, @companies = pagy(Company.order(:name), page_param: :page_az, params: { active_tab: 'az' })
        elsif params[:letter] == '#'
            @pagy_az, @companies = pagy(Company.order(:name).where("name REGEXP ?", 
            "^[^a-z]").order('name'), page_param: :page_az, params: { active_tab: 'az' })
        else
            @pagy_az, @companies = pagy(Company.order(:name).where("name like ?",
            "#{params[:letter]}%").order('name'), page_param: :page_az, params: { active_tab: 'az' })
        end
    end

    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end