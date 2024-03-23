require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'sample.rb'

class SampleTest < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.\n
    TEXT

    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    expected_count = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.".split.count

    assert_equal(expected_count, Text.new(@file.read).word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
