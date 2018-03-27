class MembershipsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @membership = current_user.memberships.build(:group_id => params[:group_id])
  end

  def destroy
    @membership = current_user.memberships.find(params[:id])
    @membership.destroy
  end

end
