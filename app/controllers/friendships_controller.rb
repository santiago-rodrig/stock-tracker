class FriendshipsController < ApplicationController
  # GET /my_friends
  def my_friends
    @friends = current_user.friends
  end

  # GET /search_friend?friend=:id
  def search
    if params[:friend].present?
      name = params[:friend].strip.split.map { |word| word.strip }

      if name.size == 2
        @matched_friends = User.where(
          'first_name LIKE ? AND last_name LIKE ?',
          "%#{name[0]}%",
          "%#{name[1]}%"
        )

        if @matched_friends.exists?
          respond_to do |format|
            format.js { render partial: 'friendships/result' }
          end
        else
          respond_to do |format|
            flash.now[:alert] = 'There are no users with a matching name'
            format.js { render partial: 'friendships/result' }
          end
        end
      else
        respond_to do |format|
          names_must = 'Names must be "FIRST_NAME LAST_NAME"'
          for_example = ', like "John Doe" for example'
          flash.now[:alert] = names_must + for_example
          format.js { render partial: 'friendships/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please provide a name to search'
        format.js { render partial: 'friendships/result' }
      end
    end
  end

  # DELETE /friendships/:id
  # /friendships/:id is the same as friendships_path(object)
  def destroy
    friend = User.find(params[:id])
    current_user.friends.delete(friend)
    flash[:notice] = "#{friend.full_name} has been deleted from your friends"
    redirect_to my_friends_path
  end

  # POST /friendships
  # /friendships is the same as friendships_path
  def create
    friend = User.find(params[:friend])
    current_user.friends << friend
    flash[:notice] = "#{friend.full_name} has been added to your friends"
    redirect_to my_friends_path
  end
end
