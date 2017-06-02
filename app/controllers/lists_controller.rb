class ListsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: List.all }
    end
  end

  def show
    @list = List.find(params[:id])
  end
end
