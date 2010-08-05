class AddIssuesNestedSetsColumns < ActiveRecord::Migration
  def self.up
    # when the database already used redmine_subtasks plugin
    if ['parent_id','lft','rgt'].all? {|c| Issue.column_names.include?(c) }
      add_column :issues, :root_id, :integer, :default => nil
      Issue.reset_column_information
      
      Issue.update_all("parent_id = NULL, root_id = id, lft = 1, rgt = 2", "parent_id IS NULL")
      Issue.find(:all,:conditions=>"parent_id IS NOT NULL").each do |issue|
         issue.update_attribute(:parent_issue_id, issue.parent_id)
      end
    else
      add_column :issues, :parent_id, :integer, :default => nil
      add_column :issues, :root_id, :integer, :default => nil
      add_column :issues, :lft, :integer, :default => nil
      add_column :issues, :rgt, :integer, :default => nil

      Issue.update_all("parent_id = NULL, root_id = id, lft = 1, rgt = 2")
    end
  end

  def self.down
    remove_column :issues, :parent_id
    remove_column :issues, :root_id
    remove_column :issues, :lft
    remove_column :issues, :rgt
  end
end
