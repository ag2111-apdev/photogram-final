class UserController<ApplicationController
  def index
    matching_users=User.all

    @list_of_user = matching_users.order({ :created_at => :desc })
    render({:template=>"user/index.html.erb"})
  end


  def show
    if session[:user_id] == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first."})
    else
      user_name = params.fetch("path_id")
      @the_user = User.where( :username => user_name ).at(0)
      @list_of_photos=@the_user.photos
      
      render({:template=>"user/show.html.erb"})
    end
  end


  def liked_photos
    user_name=params.fetch("path_id")
    @the_user=User.where(:username=>user_name).at(0)

    @list_of_photos=@the_user.likes
    render({:template=>"user/liked_photos.html.erb"})
  end

  def show_feed
    user_name=params.fetch("path_id")
    @the_user=User.where(:username=>user_name).at(0)

    render({:template=>"user/feed.html.erb"})
  end

  def update
  end
  
end
