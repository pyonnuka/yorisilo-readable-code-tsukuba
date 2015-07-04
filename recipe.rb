# coding: utf-8

# レシピのユーザー名、レシピ名、作り方を配列で返す
def getRecipeDetail(recipe)
  recipe.split(" ")
end

def showRecipesId(recipes)
  File.open(recipes) do |f|
    ary = f.readlines
    ary.each.with_index(1) do |name, i|
      recipeDetail = getRecipeDetail(name)
      puts "#{i}: #{recipeDetail[1]} #{recipeDetail[2]}" if recipeDetail[0] == ARGV[0]
    end
  end
end

def recipeId(recipes, id)
  File.open(recipes) do |f|
    ary = f.readlines
    recipeDetail = getRecipeDetail(ary[id-1])
    puts "#{id}: #{recipeDetail[1]} #{recipeDetail[2]}" if id != 0 && recipeDetail[0] == ARGV[0]
    #showRecipesId(recipes)  if id == 0
  end
end

puts "#{ARGV[0]}:"
if ARGV.size == 2
  showRecipesId(ARGV[1])
elsif ARGV.size == 3
  recipeId(ARGV[1], ARGV[2].to_i)
end
