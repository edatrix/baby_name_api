class NamelinesController < ApplicationController

  def index
    @namelines = Nameline.all
  end

end
