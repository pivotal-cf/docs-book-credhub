# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
end

guard 'livereload' do
  watch %r{final_app/public/.*}
end

# bundle exec bookbinder publish local
guard :shell do
  ignore %r{^output}

  watch(%r{.*\.(md|erb|haml)$}) { |m| 
    n    "#{m[0]} changed..."
    puts "#{m[0]} changed..."
    `bundle exec bookbinder publish local`
  }
end