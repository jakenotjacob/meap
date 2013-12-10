module Admin::PermissionsHelper
  def permissions
    { 
      "view" => "View",
      "create tickets" => "Create Tickets",
      "delete tickets" => "Delete Tickets",
      "change states" => "Change States"
    }
  end
end
