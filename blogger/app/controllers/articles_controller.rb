class ArticlesController < ApplicationController
include ArticlesHelper
def index
	@articles = Article.all
end
def show
	@article = Article.find(params[:id])
end
def new
	@article = Article.new
end
def create
	@article = Article.new
	@article.title = params[:article][:title]
	@article.body = params[:article][:body]
	@article.save

	flash.notice ="Article '#{@article.title}' is created"
	redirect_to article_path(@article)
end
def destroy
	@article = Article.find(params[:id])
	@article.destroy
	redirect_to article_path(articles)

	flash.notice ="Article '#{@article.title}' is deleted"
end
def edit
	@article = Article.find(params[:id])
end
def update
	@article = Article.find(params[:id])
	@article.update(article_params)
	flash.notice ="Article '#{@article.title}' is updated"
	
	redirect_to article_path(@article)
end
end
