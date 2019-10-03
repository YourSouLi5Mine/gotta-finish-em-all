class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end

    def publish(page_token, content, image_path)
      fbgraph(page_token).put_picture(image_path, {message: content})
    end
  end
end
