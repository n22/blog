class Article < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
    has_many :comments, dependent: :destroy
    belongs_to :user
    validates :user_id, presence: true
end
