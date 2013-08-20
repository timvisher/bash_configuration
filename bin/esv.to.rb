#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'open-uri'
require 'clipboard'

# require 'ruby-debug';debugger;1
if ARGV.length == 0
  copystr = 'http://esv.to/' + URI::encode(Clipboard.paste)
else
  copystr = 'http://esv.to/' + URI::encode(ARGV.join(' '))
end

Clipboard.copy copystr
$stderr.puts '# "' + copystr + '" is all up in your clipboard'
print copystr

