class MapsController < ApplicationController
  def index
    @zones = Zone.all
  end
end
