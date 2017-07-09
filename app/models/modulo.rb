class Modulo < ActiveRecord::Base
	has_many :screens, class_name: "Screen"
end
