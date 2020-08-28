module ApplicationHelper
  def default_meta_tags
    {
      site: "日本全国の食の楽しみ方を知るなら|eatery japan",
      title: "<%= yield(:title) || eatery-japan %>" ,
      description: "日本全国の食の楽しみ方を知るなら|eatery japan",
      keywords:    "東京 美味しい,おすすめ グルメ,eatery japan",
      canonical: request.original_url,  # 優先されるurl
      charset: "UTF-8",
      icon: [href: image_url('favicon.ico')]
      # OGPの設定をしておくとfacebook, twitterなどの投稿を見た目よくしてくれます。
    }
  end
end
