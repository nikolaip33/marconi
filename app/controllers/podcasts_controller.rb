class PodcastsController < ApplicationController

    def new
        if logged_in?
            @podcast = Podcast.new
            @podcast.build_publisher(user_id: current_user.id)
        else
            redirect_to login_path
        end
    end

    def create

        if logged_in? && @podcast = Podcast.new(podcast_params)
        byebug
            if @podcast.save
                redirect_to @podcast
            else
                render :new
            end
        else
            redirect_to signup_path
        end
    end

    def show
        if @podcast = Podcast.find_by(id: params[:id])
            @episodes = @podcast.episodes.latest
            @reviews = @podcast.reviews.persisted
        else
            redirect_to podcasts_path
        end
    end

    def index
        if logged_in?
            @podcasts = current_user.podcasts
        else
            redirect_to login_path
        end
    end

    private

    def podcast_params
        params.require(:podcast).permit(:title, :description, :publisher_id, publisher_attributes:[:name, :user_id])
    end
end
