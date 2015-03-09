# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => {scope: :email}

  belongs_to :user
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
end
