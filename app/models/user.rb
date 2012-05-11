class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  require 'paperclip'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:name , :user_color ,:avatar ,:profile_name,:user_location
  validates :email , :uniqueness => true
  validates :user_color , :uniqueness => true
  has_attached_file :avatar,:styles => { :medium => "100x100>", :thumb => "75x75>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  

end
