class NamelinesController < ApplicationController

  def index
    # uri = "localhost:3000/api/v1/namelines"
    # namelines = RestClient.get uri
    # @namelines = JSON.parse(namelines, :symbolize_names => true)
    # @namelines = Nameline.all
  end

  private

  def namelines_params
    params.require(:namelines).permit(:state_name, :sex, :year, :name, :count)
  end

end
