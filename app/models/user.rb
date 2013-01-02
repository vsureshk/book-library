class User < ActiveRecord::Base
  attr_accessible :name, :number, :photo

  has_attached_file :photo, :styles => lambda{ |a|
                  ["image/jpeg", "image/png", "image/jpg", "image/gif"].include?( a.content_type ) ? {
                                  :thumb=> "100x100#",
                                  :small  => "150x150>",
                                  :medium => "300x300>",
                                  :large =>   "500x500>" }: {}
                                 },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
#validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


end
