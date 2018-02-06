class Ability
  include CanCan::Ability

  def initialize(member)
    # Define abilities for the passed in user here. For example:
    #
    # member ||= Member.new # guest user (not logged in)
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    # user.user_group_names.each { |name| send(name, user) if respond_to?(name) }

    # very basic permission setup
    cannot :manage, :all
    if member.present?
        can :read, Event 
        can :create, Event
        can :edit, Event, member_id: member.id
        can :update, Event, member_id: member.id
        can :destroy, Event, member_id: member.id
    end
  end
end
