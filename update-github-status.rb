require 'optparse'
require 'pp'

require 'octokit'


options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename(__FILE__)} [options]"
  
  opts.on("--token [TOKEN]", String, "TOKEN to access GitHub with") do |token|
    options[:token] = token
  end
  opts.on("--git-url [GIT_URL]", String, "GIT_URL to update") do |git_url|
    options[:git_url] = git_url
  end
  opts.on("--commit [COMMIT]", String, "COMMIT to update") do |commit|
    options[:commit] = commit
  end
  opts.on("--status [STATUS]", String, "STATUS to update") do |status|
    options[:status] = status
  end
  opts.on("--context [CONTEXT]", String, "CONTEXT to update") do |context|
    options[:context] = context
  end
  opts.on("--target-url [TARGET_URL]", String, "TARGET_URL to update") do |target_url|
    options[:target_url] = target_url
  end
end.parse!

def owner_repo(git_url)
  git_url.gsub(/^git@github.com:/, '').gsub(/.git$/, '')
end

client = Octokit::Client.new(:access_token => options[:token], :debug => true)

repo = owner_repo(options[:git_url])
commit = options[:commit]
status = options[:status]
status_options = {:context => options[:context], :target_url => options[:target_url]}
client.create_status(repo, commit, status, options)
