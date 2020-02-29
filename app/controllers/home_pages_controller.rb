class HomePagesController < ApplicationController
  def index
    redirect_to articles_path, turbolinks: true
  end
end
