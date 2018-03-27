class GroupsController < ApplicationController
  def join
      @group = Group.find(params[:id])
      @m = @group.memberships.build(:user_id => current_user.id)
  end
end
