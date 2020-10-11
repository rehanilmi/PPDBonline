class Oadm < ApplicationRecord

  validates :oadm_email, uniqueness: true

  include BCrypt

  def valid_password?(password)
      BCrypt::Password.new(self.oadm_password) == password.to_s
  end

end
