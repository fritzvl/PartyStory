class Phrase < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :original=>"1280x1024>" }




  def occupy!
    update_attribute(:occupied, true)
  end



end
