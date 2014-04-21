class Contact < ActiveRecord::Base
  belongs_to :user
  validates :name, :phone, presence: true
end
