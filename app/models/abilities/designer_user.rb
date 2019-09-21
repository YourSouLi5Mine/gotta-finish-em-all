module Abilities
  class DesignerUser
    include CanCan::Ability

    def initialize(user)
      if user.present?
      end
    end
  end
end
