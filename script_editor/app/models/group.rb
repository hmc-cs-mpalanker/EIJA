class Group < ApplicationRecord

  # groupId does not get reset to 1 when I remove all entries but defaults to 4 if 3 deleted

  # a list of userIds
  # void: adds users to a new group with a new group Number
  def createGroup(lst, groupName)
    gNum = -1

    len = Group.all.length

    if len == 0
      gNum = 1
    else

      gNum = Group.last.groupNum
      # the next number for the group
      gNum +=1
    end
    lst.each {|user| Group.create(groupNum: gNum, user_id: user, name: groupName)}
  end

  # remove a group that has a number in the db
  def removeGroup(number)
    # remove all users that are in the same group
    Group.where(groupNum: number).delete_all
  end

  # remove a single user from a single group
  # input: userID
  def removeUserGroup(uId, gId)
    Group.where(groupNum: gId).where(userId: uId).delete_all
  end

end
