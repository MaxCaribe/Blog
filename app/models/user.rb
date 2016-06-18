class User < ActiveRecord::Base
  self.primary_key=:login
  attr_accessor :password
  has_many :articles
  before_save :encrypt_password

  validates_confirmation_of :password_hash
  validates_presence_of :password_hash, :on => create
  validates_presence_of :login
  validates_uniqueness_of :login

  def self.authenticate(login, password)
    user = find_by_login login
    if user && user.password_hash == password.hash
      user
    else
      nil
    end
  end

  def encrypt_password
    if password_hash.present?
      self.password_hash=password.hash.to_s
    end
  end
end

