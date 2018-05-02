require "bundler/setup"

task :default => [:runserver]

desc "Run server"
task :runserver do
  sass = Process.spawn("sass --watch scss/application.scss:public/css/application.css --style compressed")
  server = Process.spawn("ruby -run -e httpd . -p 5555")
  trap("INT") {
    [sass, server].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }
  [sass, server].each { |pid| Process.wait(pid) }
end


desc "Deploy"
task :deploy do
  abort "Please commit your changes first" unless is_repo_clean?
  now = Time.now.strftime("%Y-%m-%d-%H-%M")
  system %{
    git checkout gh-pages &&
    git pull --rebase &&
    git rebase master &&
    git push origin gh-pages &&
    git checkout master
  }
  puts "Deployment completed..."
end


def is_repo_clean?
  current_branch = `git rev-parse --abbrev-ref HEAD`.strip
  any_changes = `git status -s | wc -l`.strip.to_i
  if any_changes == 0
    need_push = `git status 2>/dev/null`.scan(/(behind|ahead).+ by (\d+)/)
    if need_push.empty?
      return true
    else
      return false
    end
  else
    return false
  end
end
