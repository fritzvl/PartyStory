require 'rcomet/client'

class PhrasesNotifierObserver < ActiveRecord::Observer

  observe :phrase

  def after_save(phrase)
    x = RComet::Client.new('http://localhost:8000/faye')
    x.handshake
    if phrase.photo?
      x.subscribe("/new_phrases")
      x.publish("/new_phrases", phrase.id)
    else
      x.subscribe("/new_blank")
      x.publish("/new_blank", phrase.id)
    end
  end


end
