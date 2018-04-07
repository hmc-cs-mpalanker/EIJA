class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # a call-back after User object initialization via registrations_controller
  after_create :addUserGroupRelation

  def addUserGroupRelation
    group_record = Group.create(groupNum: -1, user_id: self.id)
    User.update(self.id, :groups_id => group_record.id)
  end

end
