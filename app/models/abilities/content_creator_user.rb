module Abilities
  class ContentCreatorUser
    include CanCan::Ability

    def initialize(user)
      if user.present?
        can [:show, :edit, :create], Post
      end
    end
  end
end
