class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end

    def post_in_page(token, post)
      user = fbgraph(token)
      page_access_token = user.get_connections('me', 'accounts').first['access_token']
      page = fbgraph(page_access_token)
      page.put_connections('me', 'feed', message: post.content)
      #page.put_connections('me', 'feed', message: post.content, picture: picture_url, link: link)
      #page.put_connections('me', 'photos', message: post.content)
      ##.put_picture("lib/assets/images/seeds/designer.jpg", {message: message})
    end
  end
end
