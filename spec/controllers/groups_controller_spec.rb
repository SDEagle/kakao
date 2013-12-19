require 'spec_helper'

describe GroupsController do
  describe 'PUT update' do
    context 'when trying to assign a new parent group' do
      it 'does not permit the change' do
        group = create :group
        sign_in create :user
        put :update, {id: group.id, group: {parent_group_id: 43}}
        assigns(:group).parent_group_id.should == group.parent_group_id
        assigns(:group).parent_group_id.should_not == 43
      end
    end
  end
end
