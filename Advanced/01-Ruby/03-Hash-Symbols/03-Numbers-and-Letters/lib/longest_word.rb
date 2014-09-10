require 'open-uri'
require 'json'

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  (0...grid_size).map { ('a'..'z').to_a[rand(26)] }
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result

  message = ""
  score = 0
  duration = end_time - start_time
  if !attempt_is_in_the_grid?(attempt, grid)
    message = "not in the grid"
  else
    translation = translate(attempt)
    if translation.length == 0
      message = "not an english word"
    else
      message = "well done"
      score = compute_score(attempt, duration)
    end
  end

  result = {
    time: duration,
    translation: translation,
    score: score,
    message: message
  }
end

def attempt_is_in_the_grid?(attempt, grid)
  attempt.split("").all? { |character| grid.include? character }
end

def translate(attempt)
  # get json from API
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/" + attempt

  word_translated = ""
  open(api_url) do |stream|
    response = JSON.parse(stream.read)
    unless response["error"]
      word_translated = response['term0']['PrincipalTranslations']['0']['FirstTranslation']['term']
    end
  end
  puts word_translated
  word_translated
end

def compute_score(attempt, duration)
  score = attempt.size / duration
end
