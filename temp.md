<%= form_with url: cast_vote_path, method: :post do |f| %>

        <div class="space-y-3 mb-6">
          <% @candidates.each do |candidate| %>
            <label class="flex items-center gap-4 p-4 border border-gray-200 rounded-lg cursor-pointer
                          hover:border-[#1B2A4A] hover:bg-[#1B2A4A]/5 transition-colors
                          has-[:checked]:border-[#1B2A4A] has-[:checked]:bg-[#1B2A4A]/5 has-[:checked]:ring-1 has-[:checked]:ring-[#1B2A4A]">

              <%= f.radio_button :candidate_id, candidate.id,
                    class: "w-4 h-4 text-[#1B2A4A] border-gray-300 focus:ring-[#1B2A4A]" %>

              <img src="<%= candidate.photo_url %>" alt="<%= candidate.name %>"
                   class="w-12 h-12 rounded-full object-cover border border-gray-200" />

              <div class="flex-1">
                <p class="font-medium text-[#1B2A4A]"><%= candidate.name %></p>
                <p class="text-sm text-[#5C6470]"><%= candidate.party %></p>
              </div>
            </label>
          <% end %>
        </div>

        <!-- Submit -->
        <%= f.submit "Submit vote",
              class: "w-full bg-[#1B2A4A] hover:bg-[#243a63] text-white font-medium
                      py-2.5 rounded-lg transition-colors cursor-pointer" %>
      <% end %>