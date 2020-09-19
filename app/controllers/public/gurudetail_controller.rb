class Public::GurudetailController < ApplicationController

  def index
    @gurus = Guru.all
  end

  def view
    guru = params[:guru]
    @data = Guru.find(params[:guru_id])
  end
end
