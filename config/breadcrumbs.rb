crumb :root do
  link t('meta_tags.defaults.site'), root_path
end

# Праймеры
crumb :primers do
  link t('meta_tags.primers.index.title'), primers_path
end

# Категории
crumb :categories do
  link t('meta_tags.categories.index.title'), categories_path
end
crumb :category do |category|
  link category.full_name, category_path(category)

  parent :categories
end

# Позиции
crumb :positions do
  link t('meta_tags.positions.index.title'), positions_path
end
crumb :new_position do
  link t('meta_tags.positions.new.title'), new_position_path

  parent :positions
end
crumb :position do |position|
  link position.full_name, position_path(position)

  parent :positions
end
crumb :edit_position do |position|
  link t('meta_tags.positions.edit.title'), edit_position_path(position)

  parent :position, position
end

# Пользователь
crumb :user do |user|
  link t('template.common.profile'), user_path(user)
end
crumb :edit_user do |user|
  link t('template.common.settings'), edit_user_path(user)

  parent :user, user
end
