# -*- coding: utf-8 -*-

Plugin.create(:mikutter_gundam) do
  command(
          :mikutter_gundam,
          name: 'ガンダム',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    to_name   = opt.messages[0].user.idname

    msg = "@" + to_name + " "

    words = ["俺は、",
             "ガンダムになれない・・・",
             "今度こそ",
             "ガンダムに・・・",
             "貴様はガンダムではない！",
             "俺が！",
             "俺達が！",
             "ガンダムだ！！",
             "ならば、",
             "おまえはガンダムになれ！",
             "お前たちが",
             "ガンダムであるものか！"]

    n_msg = ""
    words.shuffle!

    while TRUE do
      n_msg = words.shift
      break if msg.split(//).size + n_msg.split(//).size >= 140
      msg += n_msg
      words.shuffle!
      words.push(n_msg)
    end

    Service.primary.post(:message => msg,
                         :replyto => opt.messages[0])
  end
end
