class CreatePostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "create_post_#{current_user.id}"
  end

  def create_post(data)
    ActionCable.server.broadcast("create_post_#{data['receiver_id']}", {
      post_id: data['post_id']
    })
  end
end
