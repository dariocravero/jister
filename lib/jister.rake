desc 'Gist an entire project'
namespace :jister do
  task :push do
    require 'jist'
    ROOT = ENV['JISTER_ROOT'] || Dir.pwd 
    FILES = ENV['JISTER_FILES'] ? ENV['JISTER_FILES'].split(',') : ['**/*.rb', '**/*.haml', '**/*.rake', '**/*.js', '**/*.css']

    puts "Be patient... We're preparing your gist."

    # Get the files
    files = Dir[*FILES.map { |f| File.join(ROOT, f) }]
    gist = Hash[files.map do |f| 
      [f.tap { |s| s.slice!("#{ROOT}#{File::SEPARATOR}") }.gsub('/','_-_'), File.read(f)]
    end]

    # Login if we weren't logged in before
    Jist.login! unless File.exists?(File.join(ENV['HOME'],'.jist'))

    jisted = File.join(ROOT, '.jisted')
    new_jist = !File.exists?(jisted)

    # Set the gist to public and update it if it already existed
    options = {:public => true}
    options[:update] = File.read(jisted) unless new_jist

    # Gist it!
    jist = Jist.multi_gist(gist, options)

    # Save the id if it didn't exist
    File.open(jisted, 'w') { |f| f.write jist['id'] } if new_jist

    puts "Here it is. Share it with the world:"
    puts "  #{share(jist['id'])}"
    puts "\n  URL: #{jist['html_url']}"
    puts "  Files:"
    puts "    #{files.join("\n    ")}"
  end

  task :pull, :gist_id do |t, args|
    `#{share(args[:gist_id])}`
  end

  def share(id)
    "curl -L http://jister.uxtemple.com | `which bash` -s #{id}"
  end
end
