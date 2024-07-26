# frozen_string_literal: true
require "test_helper"
require "thor/validations"

class Thor
  class ValidationsTest < Minitest::Test
    class ValidationCLI < Thor
      include Thor::Validations

      validate_before :alpha, :beta do
        puts "Running pre validation"
        true
      end

      validate_before :beta do
        puts "Running second validation"
        false
      end

      desc "alpha", "Alpha command"
      def alpha
        puts "Alpha command executed"
      end

      desc "beta", "Beta command"
      def beta
        puts "Beta command executed"
      end

    end

    def test_alpha
      cli = ValidationCLI.new
      stdout, = capture_io { cli.invoke(:alpha) }
      assert_equal "Running pre validation\nAlpha command executed\n", stdout
    end

    def test_alpha_fail
      cli = ValidationCLI.new
      error = assert_raises(Thor::Error) do
        capture_io { cli.invoke(:beta) }
      end
      assert_equal "Validation failed for beta", error.message
    end
  end
end
