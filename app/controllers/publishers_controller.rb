class PublishersController < ApplicationController

    private
    params.require(:user).permit(:name)
end
