class CreatePostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "creation_#{current_user.id}"
  end

  def creation(data)
    ActionCable.server.broadcast("creation_#{data['receiver_id']}", {
      post_id: data['post_id']
    })
  end
end
