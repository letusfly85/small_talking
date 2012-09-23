#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SmallTalking::Application.load_tasks

desc "generate user mater"
task :generate_ms_user do
    sh "rails generate scaffold ms_user name:string language:string"
end

desc "generate stories"
task :generate_rs_story do
    sh "rails generate scaffold rs_story title:string category:string summary:string contents:text user_id:integer"
end
