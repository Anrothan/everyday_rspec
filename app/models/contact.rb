class Contact < ActiveRecord::Base
	has_many :phones

	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :email, uniqueness: true, presence: true

	def name
		"#{firstname} #{lastname}"
	end

	def self.by_letter(letter)
		where("lastname LIKE ?", "#{letter}%").order(:lastname)
	end
end
