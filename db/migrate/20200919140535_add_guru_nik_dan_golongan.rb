class AddGuruNikDanGolongan < ActiveRecord::Migration[6.0]
  def change
    add_column :gurus, :guru_nip, :varchar
    add_column :gurus, :guru_golongan, :varchar
  end
end
