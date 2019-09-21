module Abilities
  class CommunityManagerUser
    include CanCan::Ability

    def initialize(user)
      if user.present?
        can :read, Post
      end
    end
  end
end
