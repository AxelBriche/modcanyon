class ArticlesController < ApplicationController

    # http_basic_authenticate_with name: "axel", password: "123", except: [:all]
    # http_basic_authenticate_with name: "axel", password: "123", only: :destroy

  def index




  ##############
  # Pour facilement se documenter au bon endroit
  ##############

  "blabla".class
  # String

  :red.class
  # Symbol


  ##############
  # Variable
  ##############

    name = "axel"
    # axel

    name.capitalize! # ! en fin de fonction applique celle-ci sur la variable
    # Axel

    "Hello #{name}, how are you?"
    # Hello Axel, how are you?"

    "Hello #{name.upcase}, how are you?"
    # Hello AXEL, how are you?"




  ##############
  # Condition
  ##############

    n = 2

    # IF
    if n.even?
      "#{n} est un chiffre pair"
    end

    # UNLESS (À moins que...)
    if n.even?
      "#{n} est un chiffre pair"
    end

    # Inline
    "#{n} est un chiffre pair" if n.even? # Un ? après une méthode signifi qu'un boolean sera retourné
    "#{n} est un chiffre pair" unless n.odd?

    # Ternaire (Inline)
    n.even? ? "#{n} est un chiffre pair" : "#{n} est un chiffre impair"





  ##############
  # Tableau
  ##############

    names = ["Axel"]
    # ["Axel"]

    names << "Marc" << "Cédric" << ['Andre', 'Jean']
    # ["Axel", "Marc", "Cédric", ["Andre", "Jean"]]

    names[3][0]
    # Andre

    names.join(', ')
    # Axel, Marc, Cédric, Andre, Jean



    ##############
    # Hash (c'est un tableau, avec des clés)
    ##############

    books = {'name' => 'Harry Potter', 'note' => 5}
    books['order'] = 1

    books
    # {"name"=>"Harry Potter", "note"=>5, "order"=>1}


    ratings = Hash.new(0) # 0 sera la valeur par défaut lorsqu'une clé n'existe pas



    ##############
    # Symboles https://www.youtube.com/watch?v=0HL3ExqBXSQ&list=PLjwdMgw5TTLVVJHvstDYgqTCao-e-BgA8&index=5
    # A 9m00s
    ##############









    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
