class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
    :lockable, :timeoutable, :trackable

  has_one :role
  has_many :posts
end
