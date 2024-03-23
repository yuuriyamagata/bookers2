Rails.application.routes.draw do
 get 'bookers/new'
  get 'bookers/index'
  get 'bookers/show'
  get 'bookers/edit'
 root to: "homes#top"
end
