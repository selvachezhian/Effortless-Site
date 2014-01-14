class CreateHtmlTemplates < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :html_templates, id: :uuid do |t|
      t.string :name
      t.uuid :created_by_id
      t.uuid :updated_by_id
      t.timestamps
    end
    add_index(:html_templates, :created_by_id)
    add_index(:html_templates, :updated_by_id)

    HtmlTemplate.create!(name: 'Template 1')
    HtmlTemplate.create!(name: 'Template 2')
    HtmlTemplate.create!(name: 'Template 3')
  end
end
