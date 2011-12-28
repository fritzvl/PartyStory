class Phrase < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "200x300>", :thumb => "80x100>", :original=>"1024x1280>" }




  def occupy!(author)
    update_attribute(:occupied, true)
    update_attribute(:author, author)
  end



end
