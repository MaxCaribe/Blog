class User < ActiveRecord::Base
  attr_accessor :password
  has_many :articles
  validates :login, :presence => true, :uniqueness => true
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  before_save :encrypt_password
  has_secure_password

  def encrypt_password
    if password.present?
      self.password_hash=password.hash
    end
  end

end

