#!/Users/sebastian/.rvm/rubies/ruby-2.2.2/bin/ruby

# USAGE: ./req.rb 'http://pwr-bad.herokuapp.com/comments?limit=10' 5 '../data-server-cache-bad.csv' true

require 'net/http'
require 'Benchmark'
require 'csv'

if ARGV.length < 1
  puts 'Missing prams: URL. Run program by typing: ./req.rb "http://example.com"'
  puts 'Program accepts follow params: '
  puts '  1: url '
  puts '  2: number_of_loops'
  puts '  3: relative_file_path'
  exit 1
end
url = URI.parse(ARGV[0])
iterations = (ARGV[1].to_i != 0) ? ARGV[1].to_i : 10
filename = ((ARGV[2] != nil) && (ARGV[2] != '')) ? ARGV[2] : "data.csv"

CSV.open(filename, "w") do |csv|
  report = Benchmark.benchmark do |x|
    (iterations+1).times do |i|
      report = (x.report{ Net::HTTP.get(url) })
      report = (report*100).to_a
      csv << [('%.3f' % report[5]).to_f] if i != 0
    end
  end
end
