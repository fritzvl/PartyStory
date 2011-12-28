collection @phrases
attributes :id, :author, :caption, :order
node :photo_url_thumb do |phrase|
  phrase.photo.url(:thumb)
end
node :photo_url_medium do |phrase|
  phrase.photo.url(:medium)
end
node :photo_url do |phrase|
  phrase.photo.url(:original)
end