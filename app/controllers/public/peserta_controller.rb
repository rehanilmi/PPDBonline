class Public::PesertaController < ApplicationController
before_action :login_peserta_required
  def index
    orang = params[:orang_id]
    @data = Orang.find_by(id: session[:orang_id])
  end

  def edit
      orang_id = params[:orang_id].to_i
      @data = Orang.find(orang_id)
  end

  def edit_post
      orang = params[:orang]
      @data = Orang.find(params[:orang_id])
      @data.orang_nama = orang[:orang_nama]
      @data.orang_tanggal_lahir = orang[:orang_tanggal_lahir]
      @data.orang_tempat_lahir = orang[:orang_tempat_lahir]
      @data.orang_nik = orang[:orang_nik]
      @data.orang_jk = orang[:orang_jk]
      @data.orang_alamat = orang[:orang_alamat]
      @data.orang_nama_ayah = orang[:orang_nama_ayah]
      @data.orang_nama_ibu = orang[:orang_nama_ibu]
      @data.orang_telepon = orang[:orang_telepon]
      @data.orang_tinggi = orang[:orang_tinggi]
      @data.orang_bb = orang[:orang_bb]
      @data.orang_gol_darah = orang[:orang_gol_darah]
      @data.orang_jarak_sekolah = orang[:orang_jarak_sekolah]
      @data.orang_jumlah_saudara = orang[:orang_jumlah_saudara]
      @data.orang_bahasa_seharihari = orang[:orang_bahasa_seharihari]
      @data.orang_kategori = orang[:orang_kategori]
      @data.orang_jenjang_pendidikan = orang[:orang_jenjang_pendidikan]
      @data.orang_status = orang[:orang_status]
      @data.orang_photo = orang[:orang_photo]
      if @data.save
        flash[:notif] = "Berhasil disimpan"
        redirect_to action: 'index'
      else
        flash[:notif] = "Data tidak tersimpan"
        render 'edit'
      end
  end
end
