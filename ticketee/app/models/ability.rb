class Ability
  include CanCan::Ability

  def initialize(user)
    user.permissions.each do |perm|
    can perm.action.to_sym,
      perm.thing_type.constantize do |thing|
        thing.nil? || perm.thing_id.nil? || perm.thing_id == thing.id
      end
    end
  end

end

