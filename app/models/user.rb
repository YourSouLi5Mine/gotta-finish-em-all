class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
    :lockable, :timeoutable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :role
  has_and_belongs_to_many :posts

  def is_community_manager?
    self.role.id == 1
  end

  def is_content_creator?
    self.role.id == 2
  end

  def is_designer?
    self.role.id == 3
  end
end
