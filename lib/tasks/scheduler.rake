require 'tweet_seed'

desc "This task is called by the Cron to Go"
namespace :seed do 
  task :tweets => :environment do 
    TweetSeed.seed 
  end
end