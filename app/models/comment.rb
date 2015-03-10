# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          not null
#  body             :text             not null
#  commentable_type :string           not null
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
  validates :commentable_id, :body, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true
end
