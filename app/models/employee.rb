class Employee < ApplicationRecord
	has_closure_tree
	validate :check_role, on: :save

	def check_role
		emp_role_id = Employee.find_by_id(self.parent_id).role_id
		role_level = Role.find_by_id(emp_role_id).level
		if role_level == 1 || role_level == 2 || role_level == 3 
			errors.add(:base, "Your not allowed to create under this role")
			retun false
		end	
	end

	def self.get_top_salary
		limit(10).order('salary desc')
	end

	def self.resigned_datas
		where(resigned: true)
	end
end
