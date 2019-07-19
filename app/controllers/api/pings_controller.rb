class Api::PingsController < ApplicationController

  def show
    render :json => {:success => true}.to_json, :status => 200
  end
end
