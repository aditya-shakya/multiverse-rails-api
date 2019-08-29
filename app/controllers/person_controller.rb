class PersonController < ApplicationController

  def index
    @people = Person.all
    render json: @people
  end
end
