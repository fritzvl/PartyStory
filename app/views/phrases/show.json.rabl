object @phrase
attributes :id, :caption
node :photo_url do
  @phrase.photo.url(:medium)
end
node :author do
  @phrase.author
end