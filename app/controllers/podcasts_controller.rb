class PodcastsController < ApplicationController

    def new
        @podcast = Podcast.new
        @podcast.build_publisher
    end

    def create
        @podcast = Podcast.new(podcast_params)
    end

    def show
        @podcast = Podcast.find_by(id: params[:id])
    end

    private

    def podcast_params
        params.require(:podcast).permit(:title, :publisher_id, publisher_attributes:[:name])
    end
end
