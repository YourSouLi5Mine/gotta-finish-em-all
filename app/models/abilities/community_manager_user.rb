module Abilities
  class CommunityManagerUser
    include CanCan::Ability

    def initialize(user)
      if user.present?
        can [:index, :accept], Post
        can :manage, CallbacksController
        can :manage, Facebook
      end
    end
  end
end
