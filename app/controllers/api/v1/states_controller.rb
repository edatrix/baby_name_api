class API::V1::StatesController < ApplicationController

  def index
    @states = State.all
  end

end
