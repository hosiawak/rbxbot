class Hug
  include Cinch::Plugin

  HUG = []
  HUG << "dobry pies"
  HUG << "http://asset.soup.io/asset/1957/5818_22e9.gif"
  HUG << "http://www.youtube.com/watch?v=SXpgvsllTgs"
  HUG << "http://asset.soup.io/asset/0590/3340_5d0d_480.jpeg"
  HUG << "http://asset.soup.io/asset/0297/6302_59e8_480.jpeg"
  HUG << "http://asset.soup.io/asset/0307/8718_332a.gif"
  HUG << "http://asset.soup.io/asset/0239/2673_c6b3_480.jpeg"
  HUG << "http://asset.soup.io/asset/1110/2106_4a32.jpeg"
  HUG << "http://asset.soup.io/asset/1097/6522_76ce_480.jpeg"
  HUG << "http://asset.soup.io/asset/1103/3318_ae9d_480.jpeg"
  HUG << "http://asset.soup.io/asset/1030/8466_dcaa_480.jpeg"
  HUG << "Everybody needs a hug. It changes your metabolism."
  HUG << "A hug is worth a thousand words."
  HUG << "Hugs grease the wheels of the world."
  HUG << "Sometimes it's better to put love into hugs than to put it into words."

  ME_HUG = []
  ME_HUG << "hugs %s"
  ME_HUG << "wraps %s in a hug"

  listen_to :channel
  prefix /^@/
  match /hug (\w+)/, :method => :hug

  def hug(m,nick)
    if rand(10) > 2
      m.reply "#{nick}: #{HUG.sample}"
    else
      m.channel.action(ME_HUG.sample % nick)
    end
  end

end
