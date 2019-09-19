class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
    :lockable, :timeoutable, :trackable

  belongs_to :role
  has_many :posts
end
