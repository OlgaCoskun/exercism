class HighScores

  attr_reader :scores

  def initialize(scores = [])
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top
    scores.max(3)
  end

  def report
    "Your latest score was #{latest}. #{result}"
  end

  private

  def result
    if new_personal_best?
      "That's your personal best!"
    else
      "That's #{best_and_latest} short of your personal best!"
    end
  end

  def new_personal_best?
    latest == personal_best
  end

  def best_and_latest
    personal_best - latest
  end
end
