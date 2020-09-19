class Public::InfodetailController < ApplicationController

  def index
    @infos = Info.all
  end

  def view
    info = params[:info]
    @data = Info.find(params[:info_id])
  end

end
