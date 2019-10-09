class RejectChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rejections_#{current_user.id}"
  end

  def rejection(data)
    ActionCable.server.broadcast("rejections_#{data['receiver_id']}", {
      post_id: data['post_id']
    })
  end
end
