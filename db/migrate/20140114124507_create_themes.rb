class CreateThemes < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :themes, id: :uuid do |t|
      t.string :name
      t.uuid :html_template_id
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:themes, :html_template_id)
    add_index(:themes, :created_by_id)
    add_index(:themes, :updated_by_id)

    template_1 = HtmlTemplate.find_by_name('Template 1')
    template_2 = HtmlTemplate.find_by_name('Template 2')
    template_3 = HtmlTemplate.find_by_name('Template 3')

    template_1.themes.create!(name: 'Theme 1')
    template_1.themes.create!(name: 'Theme 2')
    template_1.themes.create!(name: 'Theme 3')
    template_1.themes.create!(name: 'Theme 4')
    template_1.themes.create!(name: 'Theme 5')

    template_2.themes.create!(name: 'Theme 1')
    template_2.themes.create!(name: 'Theme 2')
    template_2.themes.create!(name: 'Theme 3')
    template_2.themes.create!(name: 'Theme 4')
    template_2.themes.create!(name: 'Theme 5')

    template_3.themes.create!(name: 'Theme 1')
    template_3.themes.create!(name: 'Theme 2')
    template_3.themes.create!(name: 'Theme 3')
    template_3.themes.create!(name: 'Theme 4')
    template_3.themes.create!(name: 'Theme 5')
  end
end
