<% provide(:title, 'Reset password') %>
<h1>Reset password</h1>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <%= form_with(model: @user, url: password_reset_path(params[:id]),
        local: true) do |f| %>
        <%= render 'shared/error_messages' %>
        
        <%= hidden_field_tag :email, @user.email %>
        <%= f.label :password %>
        <%= f.password_field :password, class: 'form-control' %>
        <%= f.label :password_confirmation, "Confirmation" %>
        <%= f.password_field :password_confirmation, class: 'form-control' %>
        
        <%= f.submit "Update password", class: "btn btn-primary" %>
        <% end %>
    </div>
</div>