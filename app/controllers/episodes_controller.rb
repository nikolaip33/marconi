class EpisodesController < ApplicationController

    def new
        @episode = Episode.new
    end

    def create
        @episode = Episode.new(episode_params)
        if @episode.save
            redirect_to @episode
        else
            render :new
        end
    end

    def edit
        
    end

    def update

    end

    def show
        @episode = Episode.find_by(id: params[:id])
    end

    def index
        @episodes = Episode.all
    end

    def destroy

    end

    private

    def episode_params
        params.require(:episode).permit(:title, :summary, :number, :length, :publish_date, :player_embed, :podcast_id)
    end
end
