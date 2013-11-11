require "json"
require "./mygem/orchestrate/lib/orchestrate"

# =================================================================================================
#  Orchestrate.io example application data
# =================================================================================================
@films = { 
	'the_godfather' => 
		'{
		  "Title": "The Godfather",
		  "Year": 1972,
		  "Rated": "R",
		  "Released": "24 Mar 1972",
		  "Runtime": "2 h 55 min",
		  "Genre": "Crime, Drama",
		  "Director": "Francis Ford Coppola",
		  "Writer": "Mario Puzo, Francis Ford Coppola",
		  "Actors": "Marlon Brando, Al Pacino, James Caan, Diane Keaton",
		  "Plot": "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		  "Poster": "http://ia.media-imdb.com/images/M/MV5BMjEyMjcyNDI4MF5BMl5BanBnXkFtZTcwMDA5Mzg3OA@@._V1_SX300.jpg",
		  "imdbRating": 9.2,
		  "imdbVotes": "730,156",
		  "imdbID": "tt0068646",
		  "Type": "movie",
		  "Response": "True"
		}',
	'the_godfather_part_2' =>
	  '{
	    "Title": "The Godfather: Part II",
	    "Year": 1974,
	    "Rated": "R",
	    "Released": "20 Dec 1974",
	    "Runtime": "3 h 20 min",
	    "Genre": "Crime, Drama",
	    "Director": "Francis Ford Coppola",
	    "Writer": "Francis Ford Coppola, Mario Puzo",
	    "Actors": "Al Pacino, Robert De Niro, Robert Duvall, Diane Keaton",
	    "Plot": "The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on his crime syndicate stretching from Lake Tahoe, Nevada to pre-revolution 1958 Cuba.",
	    "Poster": "http://ia.media-imdb.com/images/M/MV5BNDc2NTM3MzU1Nl5BMl5BanBnXkFtZTcwMTA5Mzg3OA@@._V1_SX300.jpg",
	    "imdbRating": 9.0,
	    "imdbVotes": "473,096",
	    "imdbID": "tt0071562",
	    "Type": "movie",
	    "Response": "True"
	  }',
	'the_godfather_part_3' =>
    '{
      "Title": "The Godfather: Part III",
      "Year": 1990,
      "Rated": "R",
      "Released": "25 Dec 1990",
      "Runtime": "2 h 49 min",
      "Genre": "Crime, Drama, Mystery, Thriller",
      "Director": "Francis Ford Coppola",
      "Writer": "Mario Puzo, Francis Ford Coppola",
      "Actors": "Al Pacino, Diane Keaton, Andy Garcia, Talia Shire",
      "Plot": "In the midst of trying to legitimize his business dealings in 1979 New York and Italy, aging mafia don Michael Corleone seeks to vow for his sins while taking a young protégé under his wing.",
      "Poster": "http://ia.media-imdb.com/images/M/MV5BMTU2MTA1NDMwNF5BMl5BanBnXkFtZTcwNjQzNDM5MQ@@._V1_SX300.jpg",
      "imdbRating": 7.6,
      "imdbVotes": "172,878",
      "imdbID": "tt0099674",
      "Type": "movie",
      "Response": "True"
    }',
	'the_shawshank_redemption' =>
    '{
      "Title": "The Shawshank Redemption",
      "Year": 1994,
      "Rated": "R",
      "Released": "14 Oct 1994",
      "Runtime": "2 h 22 min",
      "Genre": "Crime, Drama",
      "Director": "Frank Darabont",
      "Writer": "Stephen King, Frank Darabont",
      "Actors": "Tim Robbins, Morgan Freeman, Bob Gunton, William Sadler",
      "Plot": "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
      "Poster": "http://ia.media-imdb.com/images/M/MV5BMTc3NjM4MTY3MV5BMl5BanBnXkFtZTcwODk4Mzg3OA@@._V1_SX300.jpg",
      "imdbRating": 9.3,
      "imdbVotes": "1,027,465",
      "imdbID": "tt0111161",
      "Type": "movie",
      "Response": "True"
    }',
   'pulp_fiction' =>
    '{
      "Title": "Pulp Fiction",
      "Year": 1994,
      "Rated": "R",
      "Released": "14 Oct 1994",
      "Runtime": "2 h 48 min",
      "Genre": "Crime, Drama, Thriller",
      "Director": "Quentin Tarantino",
      "Writer": "Quentin Tarantino, Roger Avary",
      "Actors": "John Travolta, Uma Thurman, Samuel L. Jackson, Bruce Willis",
      "Plot": "The lives of two mob hit men, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
      "Poster": "http://ia.media-imdb.com/images/M/MV5BMjE0ODk2NjczOV5BMl5BanBnXkFtZTYwNDQ0NDg4._V1_SX300.jpg",
      "imdbRating": 9.0,
      "imdbVotes": "801,931",
      "imdbID": "tt0110912",
      "Type": "movie",
      "Response": "True"
    }',
	'the_good_the_bad_and_the_ugly' =>
    '{
      "Title": "The Good, the Bad and the Ugly",
      "Year": 1966,
      "Rated": "M",
      "Released": "29 Dec 1967",
      "Runtime": "2 h 41 min",
      "Genre": "Adventure, Western",
      "Director": "Sergio Leone",
      "Writer": "Luciano Vincenzoni, Sergio Leone",
      "Actors": "Clint Eastwood, Eli Wallach, Lee Van Cleef, Aldo Giuffrè",
      "Plot": "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.",
      "Poster": "http://ia.media-imdb.com/images/M/MV5BMjIxNjYwNDMzMl5BMl5BanBnXkFtZTcwODA5Mzg3OA@@._V1_SX300.jpg",
      "imdbRating": 9.0,
      "imdbVotes": "312,469",
      "imdbID": "tt0060196",
      "Type": "movie",
      "Response": "True"
    }'
} # @films

@comments = [
    '{
      "User": "hank_sartin",
      "Text": "It\'s hard to find a moment in the film that isn\'t great. The Godfather lives up to the term masterpiece."
     }',
    '{
      "User": "ryan_cracknell",
      "Text": "Coppola offers a rich and layered look at family and does so with an incredible cast and a meticulous amount of detail."
     }',
    '{
      "User": "andrew_sarris",
      "Text": "Brando\'s triumph and fascination is less that of an actor of parts than of a star galaxy of myths."
     }',
    '{
      "User": "gene_siskel",
      "Text": "To permit us a glimpse at The Mob, with all of its ethnic insularity, is like giving a chronic gambler a chance to wander above the false mirrors that overlook every casino."
     }',
    '{
      "User": "peter_bradshaw",
      "Text": "A measured, deathly serious epic."
     }',
] # @comments


# =================================================================================================
#  Populate the Orchestrate.io example application
# =================================================================================================

def populate_example_app(orchestrate)

	# -----------------------------------------------------------------------------------
	#  Populate the films collection
	#
	@films.keys.each do |key|
		orchestrate.put_collection_key(collection: 'films',	key: key, json: @films[key])
		puts @films[key]
	end

	# -----------------------------------------------------------------------------------
	#  Populate films/comments events for key 'the_godfather'
	#
 	@comments.each do |comment|
			orchestrate.put_event(collection: 'films', key: 'the_godfather', event_type: :comments, json: comment)
 	end

	# -----------------------------------------------------------------------------------
	#  Create the films/sequel relations for the Godfather series
	#
	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_2')

	orchestrate.put_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
													 collection_B: 'films', key_B: 'the_godfather_part_3')

end


# =================================================================================================
#  Cleanup/empty/reset/delete/etc the Orchestrate.io sample application
#
#   Deleting collection keys works as expected.  Not true for relations and events.
#   Guessing that the implementation didn't make it into the v0 beta.
#
# =================================================================================================
def clean_up_example_app(orchestrate)

	# -----------------------------------------------------------------------------------
	#  Delete the films/films sequel relationship
	#
	# Try deleting each relation individually (corresponding to how they were 'put')
	orchestrate.delete_relation(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel',
		   												collection_B: 'films', key_B: 'the_godfather_part_2')
	orchestrate.delete_relation(collection_A: 'films', key_A: 'the_godfather_part_2', relation: 'sequel',
															collection_B: 'films', key_B: 'the_godfather_part_3',)
	# Try deleting all 'sequel' relations [that may have been] associated with the key, although
	# there was only one 'the_godfather/sequel' relation in this example
	orchestrate.delete_relation_all(collection_A: 'films', key_A: 'the_godfather', relation: 'sequel')

	# -----------------------------------------------------------------------------------
	#  Delete the 'films/comments' events for key 'the_godfather'
	#
	# Try deleting all 'comments' events associated with the key
	orchestrate.delete_events(collection_A: 'films', key: 'the_godfather', event_type: 'comments')

	# -----------------------------------------------------------------------------------
	#  Delete the collection 'films' keys
	#
	@films.keys.each do |key|
		orchestrate.delete_collection_key(collection: 'films',	key: key)
	end
	
end


# =================================================================================================
#  Get a client and get started!
#
#  This is what 'orch_config.json' looks like:
# 	 {
#    	 "base-url":"https://api.orchestrate.io/v0",
#   	 "user":"<user-key-from-orchestrate.io>"
# 	 }
# =================================================================================================
@orch_config = JSON.parse(open("orch_config.json").read)

def get_orchestrate_client
	user = @orch_config['user-example'] 
	client = NoDB::Orchestrate.new('base-url' => @orch_config['base-url'], 'user' => user)
	puts "user: '#{user}'"
	client
end

orch_client = get_orchestrate_client

populate_example_app(orch_client)
clean_up_example_app(orch_client)









