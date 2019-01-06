class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  before_create :generate_api_key

  has_many :favorites
  has_secure_password

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(15)
  end
end
