require 'rubygems'
require 'unirest'
require 'dotenv'
require 'dotenv/load'

class Air < ApplicationRecord
  belongs_to :location
  
end #end of class 
