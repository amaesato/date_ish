class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :gender
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy

  def self.gender
    %w(female male other)
  end

  def user_name
    "#{first_name} #{last_name}".strip
  end
end
