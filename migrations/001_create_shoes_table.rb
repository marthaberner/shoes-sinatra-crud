Sequel.migration do
  up do
    create_table(:shoes) do
      primary_key :id
      String :name, :null=>false
      Integer :size, :null=>false
    end
  end

  down do
    drop_table(:shoes)
  end
end