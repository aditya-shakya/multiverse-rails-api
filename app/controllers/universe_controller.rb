class UniverseController < ApplicationController

  def families
    @families = Family.joins(:people).where(people: {universe_id: params[:id]})
    render json: @families
  end
end
