class PublishersController < ApplicationController

    def show
        @publisher = Publisher.find_by(id: params[:id])
    end

    private
    def publisher_params
        params.require(:user).permit(:name)
    end
end
