class AddTables < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)
      t.column(:project_id, :integer)
    end
    create_table(:projects) do |t|
      t.column(:name, :string)
    end
    create_table(:divisions) do |t|
      t.column(:name, :string)
    end
  end
end
