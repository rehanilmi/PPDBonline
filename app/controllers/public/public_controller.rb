class Public::PublicController < ApplicationController
  def main
  end
  def guru
    @gurus = Guru.latest
  end

  def staff
    @stafs = Staf.all
  end

  def pengumuman
      info = params[:info]
      @data = Info.find(params[:info_id])
  end

  def vdm
  end

  def test
  end

end
