class AddStafNikDanGolongan < ActiveRecord::Migration[6.0]
  def change
    add_column :stafs, :staf_nip, :varchar
    add_column :stafs, :staf_golongan, :varchar
  end
end
