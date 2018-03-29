class Group < ApplicationRecord

  # a list of userIds
  # void: adds users to a new group with a new group Number
  def createGroup(lst)
    gNum = -1

    len = Group.all.length

    if len == 0
      gNum = 1
    else

      gNum = Group.last.groupNum
      # the next number for the group
      gNum +=1
    end
    lst.each {|user| Group.create(groupNum: gNum, user_id: user)}
  end

  # remove a group that has a number in the db
  def removeGroup(number)
    # remove all users that are in the same group
    Group.delete_all ["groupNum = ?", number]
  end

  # remove a single user from a group
  # input: userID
  def removeUserGroup(id)
    Group.delete_all ["user_id = ?", id ]
  end
  
end
