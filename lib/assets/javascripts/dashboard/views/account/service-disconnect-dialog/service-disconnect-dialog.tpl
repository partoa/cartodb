<div class="CDB-Text Dialog-header u-inner">
  <div class="Dialog-headerIcon Dialog-headerIcon--negative">
    <i class="CDB-IconFont CDB-IconFont-cloud"></i>
  </div>
  <p class="Dialog-headerTitle">
    Disconnect your <%= title %> account
  </p>
  <p class="Dialog-headerText">
  <% if (revoke_url) { %>
    Revoke the access to CARTO
  <% } else { %>
    Are you sure you want to revoke the CARTO access to your <%= title %> account?
  <% } %>
  </p>
</div>

<% if (revoke_url) { %>
  <div class="Dialog-body">
    <p class="DefaultParagraph DefaultParagraph--short DefaultParagraph--centered DefaultParagraph--spaced">
      We cant revoke the access for your <%= title %> account automatically.
    </p>
    <p class="DefaultParagraph DefaultParagraph--short DefaultParagraph--centered DefaultParagraph--spaced">
      For your own security, we are unable to disconnect your <%= title %> account from CARTO. You can revoke access yourself by manually editing your <%= title %> authorized applications.
    </p>
  </div>
<% } %>

<div class="Dialog-footer u-inner">
  <% if (revoke_url) { %>
    <a href="<%- revoke_url%>" target="_blank" rel="noopener noreferrer" class="Button Button-inner Button--inline Button--secondary ">
      <span>go to<%= title %></span>
    </a>
  <% } else { %>
    <button class="CDB-Text Button Button--secondary Dialog-footerBtn Button--inline js-cancel">
      <span>cancel</span>
    </button>
    <button class="CDB-Text js-revoke Button Button--negative Button--inline">
      <span>Revoke access</span>
    </button>
  <% } %>
</div>
