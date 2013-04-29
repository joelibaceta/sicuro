require File.join(File.dirname(__FILE__), 'file.rb')

class Sicuro
  class Runtime
    module Constants
      module DummyFS
        # Worst excuse of an FS ever.

        FAKE_GEM_DIR = "/home/sicuro/.gem/ruby/#{RUBY_VERSION}/gems"

        def self.activate!
          $:.clear
          $: << File.join(FAKE_GEM_DIR, 'sicuro', 'lib')
        end

        def self.has_file?(file)
          ret = self.find_file(file)
          ret && !ret.empty?
        end

        def self.find_file(file)
          return [] unless file # find_file(nil) => everything.

          @@files.keys.grep(%r[#{file}(\..*)?$])
        end

        def self.add_file(name, contents)
          @@files ||= {}
          @@files[name] = contents
        end

        def self.add_real_file(file, name = nil)
          name ||= file
          DummyFS.add_file(name, open(file).read)
        end

        def self.get_file(file)
          return @@files[file] if @@files.keys.include?(file)
          raise ::Errno::ENOENT, "No such file or directory - #{file}"
        end

        Dir[File.join(File.dirname(__FILE__), '..', '**', '*.rb')].each do |filename|
          fake_filename = filename.gsub(File.dirname(__FILE__), '').gsub(%r[^/..], File.join(FAKE_GEM_DIR, 'sicuro', 'lib', 'sicuro'))
          DummyFS.add_real_file(filename, fake_filename)
        end
      end

    end
  end
end