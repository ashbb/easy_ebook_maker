sample page
-----------

This is a sample page. <br>
You can edit each **.md** text files with **Markdown format**.<br>

	# sample1.rb
	puts 'Hello world!'

**rlbanner.jpg**

![rlbanner.jpg](http://github.com/ashbb/easy_ebook_maker/tree/master%2Fimg%2Frlbanner.jpg?raw=true)

	# adventure_game.rb
	
	class Thing
	  def initialize name, description
	    @name, @description = name, description
	  end
	  
	  attr_reader :name, :description
	end
	
	class Room < Thing
	  def initialize name, description, n, s, w, e
	    super name, description
	    @n, @s, @w, @e = n, s, w, e
	  end
	  
	  attr_reader :n, :s, :w, :e
	end
	
	class Map < Array
	  def initialize *args
	    @rooms = super args
	  end
	  
	  attr_reader :rooms
	end
	
	class Actor < Thing
	  def initialize name, description, room_number
	    super name, description
	    @position = room_number
	  end
	  
	  attr_accessor :position
	end
	
	class Game
	  def initialize map, player
	    @map, @player = map, player
	  end
	  
	  attr_reader :map
	end
	
	class Implementer
	  def initialize player
	    r0 = Room.new "Treasure Room", "a fabulous golden chamber", -1, 2, -1, 1
	    r1 = Room.new "Dragon's Lair", "a huge and glittering lair", -1, -1, 0, -1
	    r2 = Room.new "Troll Cave", "a dank and gloomy cave", 0, -1, -1, 3
	    r3 = Room.new "Crystal Dome", "a vast dome of glass", -1, -1, 2, -1
	    map = Map.new r0, r1, r2, r3
	    @game = Game.new map, player
	  end
	  
	  def moveActorTo player, sym
	    cr = @game.map.rooms[player.position]
	    case mr = cr.send(sym)
	    when -1
	      "Go #{sym}.\nNo exit. #{player.name} stayed in the room:#{player.position}."
	    else
	      player.position = mr
	      "Go #{sym}.\n#{player.name} moved to the room:#{player.position}."
	    end
	  end    
	end
	
	# a sample game story
	player = Actor.new "Satoshi", "Ruby Lover", 0
	puts "#{player.name} starts playing the game."
	puts
	puts <<-EOS
	    ===== The Map =====
	     room:0 -- room:1
	       |
	     room:2 -- room:3
	    ===================
	EOS
	puts
	print "#{player.name} is a #{player.description}. "
	puts "Starts at room:#{player.position}."
	puts
	imp = Implementer.new player
	puts imp.moveActorTo(player, :e)
	puts imp.moveActorTo(player, :w)
	puts imp.moveActorTo(player, :n)
	puts imp.moveActorTo(player, :s)
	puts imp.moveActorTo(player, :e)
	puts imp.moveActorTo(player, :s)

**adv\_on\_shoes.png**

![adv\_on\_shoes.png](http://github.com/ashbb/easy_ebook_maker/tree/master%2Fimg%2Fadv\_on\_shoes.png?raw=true)


test
----
![sample93.png](http://www.rin-shun.com/rubylearning/shoes/sample93.png)

