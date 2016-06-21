class User < ActiveRecord::Base
  require 'digest/sha1'
  has_many :articles
  validates :login, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create
  has_secure_password


end

