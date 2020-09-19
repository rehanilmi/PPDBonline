class Public::PengumumanDetailController < ApplicationController

  def index
    @data = Info.all
  end

  def view
    info = params[:info]
    @data = Info.find(params[:info_id])
  end

end
