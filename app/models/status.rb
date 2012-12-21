class Status < ActiveRecord::Base
  belongs_to :user

  attr_accessible :message, :active, :updated

  validates_presence_of :message
  validates_associated :user
  validates_uniqueness_of :user_id

  default_scope order("updated_at desc")
end
