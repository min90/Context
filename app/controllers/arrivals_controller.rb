class ArrivalsController < ApplicationController

  def index
    @users = User.all
  end
end
