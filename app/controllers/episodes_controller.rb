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
        @podcast = @episode.podcast
        @reviews = @podcast.reviews.persisted
    end

    def index
        if params[:podcast_id]
            if @podcast = Podcast.find_by(id: params[:podcast_id])
                if logged_in? && admin? && @podcast.user != current_user
                    redirect_to episodes_path
                else
                    @episodes = @podcast.episodes
                end
            else
                redirect_to episodes_path
            end
        else
            if logged_in? && admin?
                @episodes = current_user.episodes
            else
                @episodes = Episode.all
            end
        end

    end

    def destroy

    end

    private

    def episode_params
        params.require(:episode).permit(:title, :summary, :number, :length, :publish_date, :player_embed, :podcast_id)
    end
end
