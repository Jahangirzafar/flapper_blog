# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  published_at :date
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ActiveRecord::Base
	has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
end
