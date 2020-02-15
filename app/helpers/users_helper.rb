module UsersHelper
  def relation_with(user, other_user)
    are_the_same = user == other_user
    is_friend = user.friends.include?(other_user)

    if are_the_same
      'Yourself'
    elsif is_friend
      'Friend'
    else
      'Stranger'
    end
  end
end
