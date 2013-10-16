#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'open-uri'
require 'clipboard'

verse_part = !ARGV.empty? ? ARGV.join(' ') : gets

if !verse_part || 0 == verse_part.length
  verse_part = Clipboard.paste
end

# require 'ruby-debug';debugger;1

copystr = 'http://esv.to/' + URI::encode(verse_part.sub('.', ':'))

Clipboard.copy copystr
$stderr.puts '# "' + copystr + '" is all up in your clipboard'
print copystr

