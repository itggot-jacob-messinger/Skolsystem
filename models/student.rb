class Student

	include DataMapper::Resource

	property :id, Serial
	property :first_name, String, required: true
	property :last_name, String, required: true
	property :pnr, String, required: true, unique: true

belongs_to :klass	
end