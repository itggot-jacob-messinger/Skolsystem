class Seeder

	def self.seed!
		self.klass
		self.student

	end

	def self.klass
		Klass.create(name: "2C")
		Klass.create(name: "2A")
	end

	def self.student
		Student.create(first_name: "Jacob",
						last_name: "Messinger", 
						pnr: "19980701-1111",
						klass_id: 1
			)
		Student.create(first_name: "Caroline",
						last_name: "Winther",
						pnr: "19980330-2222",
						klass_id: 2

			)
		Student.create(first_name: "Alexander",
						last_name: "Samuelsson",
						pnr: "19980308-3333",
						klass_id: 1

			)
	end
end