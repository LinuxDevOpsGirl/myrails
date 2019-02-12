class SonglistsController < ApplicationController
    before_action :set_songlist, only: [:show, :edit, :update]

    # GET /songlists
    # GET /songlists.json
    def index
        if params[:letter].blank?
            @pagy_az, @songlists = pagy(Songlist.order(:name), page_param: :page_az, params: { active_tab: 'az' })
          elsif params[:letter] == '#'
            @pagy_az, @songlists = pagy(Songlist.order(:name).where("name REGEXP ?", 
            "^[^a-z]").order('name'), page_param: :page_az, params: { active_tab: 'az' })
          else
            @pagy_az, @songlists = pagy(Songlist.order(:name).where("name like ?",
            "#{params[:letter]}%").order('name'), page_param: :page_az, params: { active_tab: 'az' })
          end
    end

    # GET /songlists/1
    # GET /songlists/1.json
    def show
    end

    # GET /songlists/new
    def new
        @songlist = Songlist.new
    end

    # GET /songlists/1/edit
    def edit
    end

    # POST /songlists
    # POST /songlists.json
    def create
        @songlist = Songlist.new(songlist_params)

        respond_to do |format|
        if @songlist.save
            format.html { redirect_to @songlist, notice: 'Songlist was successfully created.' }
            format.json { render :show, status: :created, location: @songlist }
        else
            format.html { render :new }
            format.json { render json: @songlist.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /songlists/1
    # PATCH/PUT /songlists/1.json
    def update
        respond_to do |format|
        if @songlist.update(songlist_params)
            format.html { redirect_to @songlist, notice: 'Songlist was successfully updated.' }
            format.json { render :show, status: :ok, location: @songlist }
        else
            format.html { render :edit }
            format.json { render json: @songlist.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /songlists/1
    # DELETE /songlists/1.json
    # def destroy
    #   @songlist.destroy
    #   respond_to do |format|
    #     format.html { redirect_to songlists_url, notice: 'Songlist was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_songlist
        @songlist = Songlist.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def songlist_params
        params.fetch(:songlist, {})
        end


end