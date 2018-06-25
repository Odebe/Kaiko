# frozen_string_literal: true

KAIKO_ROOT_PATH = __dir__
require_relative 'system/boot'

map('/posts') { run Kaiko::Controllers::Posts }
map('/') { run Kaiko::Controllers::Base }
