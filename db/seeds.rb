require_relative 'jeopardy_seeder'
require_relative 'aws_seeder'

JeopardySeeder.new.seed
AwsSeeder.new.seed
