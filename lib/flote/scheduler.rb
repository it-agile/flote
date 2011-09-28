class Scheduler

  def initialize runner
    @runner = runner
  end

  def start
    @runner.start
    while continue? do
      sleep 1
      @runner.execute
    end
  end

end