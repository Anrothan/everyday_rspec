class Phone < ActiveRecord::Base
	has_one :contacts

	validates :phone_type, presence: true
validates :phone, uniqueness: { scope: :contact_id }, presence: true
end
