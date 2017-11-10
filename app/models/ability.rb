class Ability
  include Hydra::Ability
  
  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    if current_user.admin?
      can :manage, :all 
    end
    #   can [:destroy], ActiveFedora::Base

    # Limits creating new objects to a specific group
    #
  end
end
