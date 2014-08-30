class News_FeedController &lt; ApplicationController
  def index
    @feed = PublicActivity::News_Feed.order(&quot;created_at desc&quot;)
  end
end