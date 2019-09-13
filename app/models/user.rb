class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable,
    :lockable, :timeoutable, :trackable
end
