<%= form_for (@post) do |f| %>
  <% if @post.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@idea.errors.count, "error") %> prohibited this idea from being saved:</h2>

      <ul>
      <% @post.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
  </div>
  
  <div class="field">
    <%= f.label :description %><br />
    <%= f.text_area :description %>
  </div>
  <div class="field">
    <%= f.label :photo %><br />
    <%= f.file_field :photo %>
  </div>
  <div class="field">
    <%= f.label :url %><br />
    <%= f.text_field :url %>
  </div>
  <div class="field">
    <%= f.label :medium_16mm, "16mm" %>
    <%= f.radio_button :medium, "16mm" %>
    <br/>

    <%= f.label :medium_digital, "Digital" %>
    <%= f.radio_button :medium, "Digital" %>
  </div>

  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>