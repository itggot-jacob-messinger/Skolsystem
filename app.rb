class App < Sinatra::Base
    enable :sessions

    get '/' do
        @klasser = Klass.all
        erb :index
    end

    get '/klass/:name' do |name|
        @klass = Klass.first(name: name)
        unless @klass
            status 418
        end

        @students = Student.all(klass: @klass)
            erb :klass
        end

    get '/klass/:name/student/:student' do |name, student|
        @klass = Klass.first(name: name)

        @student = Student.first(id: student, klass: @klass)
        erb :student
    end

    get '/create/klass' do 
        erb :c_klass
    end

    post '/create/klass' do 
        Klass.create(name: params["new_klass"].upcase)
        redirect "/"
    end

    get '/remove/klass' do
        @klasser = Klass.all 
        erb :r_klass
    end

    post '/remove/klass' do
        Klass.all(id: params['remove_klass']).destroy
        redirect "/"
        # Klass.delete(id: params["remove_klass"])
    end    

    get '/create/student' do 
        erb :c_student
    end

    post '/create/student' do 
        Klass.create(name: params["new_student"].upcase)
        redirect "/"
    end

    get '/remove/student' do
        @klasser = Klass.all 
        erb :r_student
    end

    post '/remove/student' do
        Klass.delete(id: params["remove_klass"])
    end 
    post '/search' do
        if params['q'].match(/^\d{2}.*$/)
            @klasser = Klass.all(:name.like => "%#{params["q"]}%")
            @students = Student.all(:pnr.like => "%#{params["q"]}%")
        else
            @klasser = Klass.all(:name.like => "%#{params["q"]}%")
            @students = Student.all(:first_name.like => "%#{params["q"]}%") + Student.all(:last_name.like => "%#{params["q"]}%")
        end
        erb :search
    end	
end