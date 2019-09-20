class Role < ApplicationRecord
  has_many :users

  scope :titleized_roles, -> { all.map { |role| OpenStruct.new({id: role.id, name: role.name.titleize}) } }
end
