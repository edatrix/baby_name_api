class StatesController < ApplicationController

  def index
    @states = State.all
  end

  def import
    State.import(params[:file])
  end

end
