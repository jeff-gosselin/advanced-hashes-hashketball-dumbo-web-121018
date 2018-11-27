require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end


def shoe_size(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  colors = []
  game_hash.each do |key, val |
    if val[:team_name] == team 
      colors = val[:colors]
    end
  end
  colors
end

def team_names
  teams = []
  game_hash.each do |key, val |
    teams << val[:team_name]
  end
  teams
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |key, val|
    if val[:team_name] == team 
      val[:players].each do |player, jersey|
        jersey_numbers << jersey[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(player)
  stats = {}
  game_hash.each do |key, val|
    if val[:players][player]
      stats = val[:players][player]
    end
  end
  stats
end

def big_shoe_rebounds
  max_shoe = []
  max_shoe_player = nil
  game_hash.each do |key, val|
    val[:players].each do |player, stats|
      if max_shoe.empty?
        max_shoe << stats[:shoe]
      end
      
      if stats[:shoe] > max_shoe.max
        max_shoe_player = player
        max_shoe << stats[:shoe]
      end
    end
  end
  if game_hash[:home][:players].include?(max_shoe_player)
    game_hash[:home][:players][max_shoe_player][:rebounds]
  else
    game_hash[:away][:players][max_shoe_player][:rebounds]
  end
end

def most_points_scored
  game_hash.map do |site, attributes| 
    attributes[:players].map do |player, stats|
      
      stats[:points].max
    end
  end
end


