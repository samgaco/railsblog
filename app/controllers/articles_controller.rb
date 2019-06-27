class ArticlesController < ApplicationController
  include ArticlesHelper
  def index 
    @articles = Article.all
  end

  def new 
    @article = Article.new
  end 

  def create 
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Well, you've created a new article ¡¡¡ WELL DONE !!!"
    redirect_to articles_path(@article)
  end 

  def show 
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' got smashed to pieces!"

    redirect_to articles_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end
