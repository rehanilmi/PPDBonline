class Public::StafdetailController < ApplicationController

  def index
    @stafs = Staf.all
  end

  def view
    staf = params[:staf]
    @data = Staf.find(params[:staf_id])
  end
end
