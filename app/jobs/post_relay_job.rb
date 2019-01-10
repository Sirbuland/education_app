class PostRelayJob < ApplicationJob
  queue_as :default

  def perform(post)
    # Do something later
    ActionCable.server.broadcast 'post_channel',PostsController.renderer.render(partial: 'post', locals: { post: post })

     
  end
end
