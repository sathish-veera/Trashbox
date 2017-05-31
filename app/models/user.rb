class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trash_requests

  validates :mobile_no, presence: true
  has_one :address_detail, as: :addressable

  def login=(login)
    @login = login
  end

  def login
    @login || self.mobile_no || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
	conditions = warden_conditions.dup
	if login = conditions.delete(:login)
	  where(conditions.to_h).where(["mobile_no = :value_int OR lower(email) = :value", { :value => login.downcase,:value_int => login.to_i }]).first
	elsif conditions.has_key?(:mobile_no) || conditions.has_key?(:email)
	  where(conditions.to_h).first
	end
  end
end