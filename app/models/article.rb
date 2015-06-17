class Article < ActiveRecord::Base
	#after_initialize :init
	validates :title, presence: true,
                    length: { minimum: 5 }
    has_many :comments, dependent: :destroy
    belongs_to :user
    validates :user_id, presence: true
    private 
=begin
    def init 
    	if logged_in?
    		self.commenter = current_user.name
    	else
    		self.commenter = 'anonymous'
    	end
    end
=end
end
