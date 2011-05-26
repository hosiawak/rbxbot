require 'atomy'
require 'timeout'

Atomy.import_kernel

class TryAtomy

  class Output
    attr_reader :type, :result, :output, :error

    def self.standard(params = {})
      Output.new(:type => :standard, :result => params[:result],
        :output => params[:output] || '')
    end

    def self.no_output
      Output.standard :result => nil
    end

    def self.error(params = {})
      params[:error] ||= StandardError.new('TryRuby Error')
      params[:error].message.gsub! /\(eval\):\d*/, '(Ruby):1'
      Output.new(:type => :error, :error => params[:error],
                 :output => params[:output] || '')
    end

    protected
    def initialize(values = {})
      values.each do |variable, value|
        instance_variable_set("@#{variable}", value)
      end
    end

  end

  def self.run_line(code)
    stdout_id = $stdout.to_i
    $stdout = StringIO.new
    result = Timeout::timeout(10) { Atomy::Compiler.evaluate(code,TOPLEVEL_BINDING) }
    result.send(Atomy.namespaced("atomy", "write").to_sym)
    output = get_stdout
    $stdout = IO.new(stdout_id)
    return Output.standard :result => result, :output => output
  rescue StandardError => e
    return Output.error :error => e, :output => get_stdout
  rescue Exception => e
    return Output.error :error => e, :output => get_stdout
  ensure
    $stdout = IO.new(stdout_id)
  end

  private
  def self.get_stdout
    raise TypeError, "$stdout is a #{$stdout.class}" unless $stdout.is_a? StringIO
    $stdout.rewind
    $stdout.read
  end

end
