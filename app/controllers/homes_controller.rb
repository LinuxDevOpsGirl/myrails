class HomesController < ApplicationController

    def index
        @films = Film.all
    end
    
end