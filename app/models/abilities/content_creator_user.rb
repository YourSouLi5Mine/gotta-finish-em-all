module Abilities
  class ContentCreatorUser
    include CanCan::Ability

    def initialize(user)
      if user.present?
      end
    end
  end
end
