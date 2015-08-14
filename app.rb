#########################################
#############__Needed-Gems__#############
#########################################

require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/word")
require("./lib/definition")


#########################################
#############__WORD-Class__##############
#########################################

get("/") do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:words_form)
end

post("/") do
  word = params.fetch("word")
  Word.new(word).save()
  @words = Word.all()
  erb(:index)
end

get("/words/:id") do
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end


#########################################
#############__DEFINITION-Class__########
#########################################

post("/word") do
  definition = params.fetch("definition")
  @definition = Definition.new(definition)
  @definition.save()
  @word = Word.find(params.fetch("word_id").to_i())
  @word.add_definition(@definition)
  erb(:word)
end


#########################################
#############__Empty-Dictionary__########
#########################################


get("/clear") do
  Word.clear()
  @words = Word.all()
  erb(:index)
end


#########################################
#############__Empty-Definitions__#######
#########################################

get("/words/:id/delete_definitions") do
  word=Word.find(params.fetch("id").to_i())
  word.definitions().clear()
  @words = Word.all()
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end


#########################################
#############__Delete Word__#############
#########################################

get('/words/:id/delete') do
  word=Word.find(params.fetch("id").to_i())
  word.delete()
  @words = Word.all()
  erb(:index)
end


#########################################
#############__Delete Definition__#######
#########################################

get('/definitions/:id/delete') do
  definition=Definition.find(params.fetch("id").to_i())
  definition.delete()
  @definitions = Definition.all()
  @word = Word.find(params.fetch("id").to_i())
  erb(:word)
end
