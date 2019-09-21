class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    if @user.is_community_manager?
      assign_community_manager_abilities!
    elsif @user.is_content_creator?
      assign_content_creator_abilities!
    elsif @user.is_designer?
      assign_designer_abilities!
    end
  end

  private

  def assign_community_manager_abilities!
    self.merge Abilities::CommunityManagerUser.new(@user)
  end

  def assign_content_creator_abilities!
    self.merge Abilities::ContentCreatorUser.new(@user)
  end

  def assign_designer_abilities!
    self.merge Abilities::DesignerUser.new(@user)
  end
end
