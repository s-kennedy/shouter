require 'pry'
require 'rubygems'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'date'

set :port, 3000
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base

	has_many :shouts
	validates_presence_of :name
	validates :handle, presence: true, uniqueness: true
	validates :password, presence: true, uniqueness: true

	# def initialize(name, handle, password)
	# 	@name = name
	# 	@handle = handle
	# 	@password = ?????

end

class Shout < ActiveRecord::Base

	belongs_to :user
	validates :message, presence: true, length: { minimum: 1, maximum: 200}
	validates :user_id, presence: true
	validates_numericality_of :likes, greater_than: -1
	validates :created_at, presence: true

end

get '/' do
	erb :index
end

post '/shout' do
end

# -------------- TESTS ------------------#

# describe User do
	
# 	before do
# 		@sharon = User.new
# 		@sharon.name = "Sharon"
# 		@sharon.handle = "sharebear"
# 		@sharon.password = "doodles"

# 	end

# 	it "should be valid with correct data" do
# 		expect(@sharon.valid?).to be_truthy
# 	end

# 	describe :name do
# 		it "should be invalid with no name" do
# 			@sharon.name = nil
# 			expect(@sharon.valid?).to be_falsy
# 		end
# 	end

# 	describe :handle do
# 		it "should be invalid if not unique" do
# 			@sharon.save
# 			@karen = User.new
# 			@karen.name = "karen"
# 			@karen.handle = "sharebear"
# 			@karen.password = "doodles"	
# 			expect(@karen.valid?).to be_falsy
# 		end
# 	end

# 	describe :handle do
# 		it "should be invalid with no handle" do
# 			@sharon.handle = nil
# 			expect(@sharon.valid?).to be_falsy
# 		end
# 	end

# 	describe :password do
# 		it "should be invalid when not unique" do
# 			@karen = User.new
# 			@karen.name = "karen"
# 			@karen.handle = "sharebear"
# 			@karen.password = "doodles"	
# 			expect(@karen.valid?).to be_falsy
# 		end
# 	end

# 	describe :password do
# 		it "should be invalid when not present" do
# 			@sharon.password = nil
# 			expect(@sharon.valid?).to be_falsy
# 		end
# 	end

# end