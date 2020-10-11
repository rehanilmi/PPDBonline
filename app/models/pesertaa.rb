class Pesertaa < ApplicationRecord
  include BCrypt
  validates :pesertaa_email, uniqueness: true

  # def validate_each(edit)
  #   unless action 'edit'
  #     validates :pesertaa_email, presence: true
  #   end
  # end

  def valid_password?(password)
      BCrypt::Password.new(self.pesertaa_password) == password.to_s
  end

  mount_uploader :pesertaa_photo, PhotopesertaUploader
end
