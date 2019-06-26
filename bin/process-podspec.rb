#!/usr/bin/env ruby

require 'json'

PATH_KEYS = ['source_files',
             'public_header_files',
             'private_header_files',
             'exclude_files',
             'module_map',
             'preserve_paths',
             'resources',
             'prefix_header_file'].freeze

def update_paths(hsh, path_prefix)
  PATH_KEYS.each do |key|
    if hsh[key].is_a? String
      hsh[key]= hsh[key].prepend(path_prefix)
    elsif hsh[key].is_a? Array
      hsh[key] = hsh[key].map { |path| path.prepend(path_prefix) }
    end
  end
  hsh
end

podspec_json_path = ARGV[0]
path_prefix = "#{ARGV[1]}/"

file = File.read(podspec_json_path)
spec = JSON.parse(file)

spec = update_paths(spec, path_prefix)
spec['subspecs'] = spec['subspecs'].map { |ss| update_paths(ss, path_prefix) } if spec.key?('subspecs')
spec['ios'] = update_paths(spec['ios'], path_prefix) if spec.key?('ios')
spec['osx'] = update_paths(spec['osx'], path_prefix) if spec.key?('osx')
spec['tvos'] = update_paths(spec['tvos'], path_prefix) if spec.key?('tvos')
spec['watchos'] = update_paths(spec['watchos'], path_prefix) if spec.key?('watchos')

puts JSON.pretty_generate(spec)
