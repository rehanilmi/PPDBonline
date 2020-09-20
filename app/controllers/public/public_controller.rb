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
    @infos = Info.all
  end

  def vdm
  end

  def test
  end

  def strukturorg
  end

  def fasilitas
  end 

end
