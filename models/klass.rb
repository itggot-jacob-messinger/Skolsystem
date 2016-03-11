class Klass

include DataMapper::Resource 

	property :id, Serial
	property :name, String, required: true

has n, :students
end