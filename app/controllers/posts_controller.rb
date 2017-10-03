class PostsController < ApplicationController

  def post_params
    params.require(:post).permit(:driver_id, :from, :to, :start_time, :split_gas?)
  end

  def edit
  end

  def destroy
  end

  def approve
  end

  # create a new post of ride
  def create
    @post = Post.create(post_params)
    if @post.valid?
      render :json => {:data => @post, :status => 200}
    else
      render :json => {:data => nil, :status => 200}
  end
end
